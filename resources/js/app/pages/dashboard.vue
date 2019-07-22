<template>
<div class="container">
    <header id="header">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <router-link :to="{ name: 'landing-page' }" class="navbar-brand">Közút App</router-link>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                </ul>
            </div>
        </nav>
        <div id="nav">
            <div id="nav-fixed">
                <div class="container">
                    <div class="d-flex align-items-center">
                        <div class="nav-logo">
                            <router-link :to="{ name: 'landing-page' }" class="nav-link logo"><img src="img/logo.png"
                                    alt=""></router-link>
                        </div>
                        <ul class="nav-menu nav navbar-nav" v-if="!app.user" style="display: contents;">
                            <li :class="'cat-' + category.id" v-for="category in categories" v-bind:key="category.id"><a @click="clickCateg(category.id)" :class="{ active : active_el == category.id }">{{category.title}}</a></li>
                        </ul>
                        <ul class="nav-menu nav navbar-nav" v-else style="display: contents;">
                            <li class="cat-1">
                                <router-link :to="{ name: 'new-article' }" class="dropdown-item">New article</router-link>
                            </li>
                            <li class="cat-2">
                                <router-link :to="{ name: 'dashboard' }" class="dropdown-item">Dashboard</router-link>
                            </li>
                            <li class="cat-3">
                                <router-link :to="{ name: 'photo-upload' }" class="dropdown-item">Photo</router-link>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span v-if="app.user">{{ app.user.name }}</span>
                                    <span v-else>Backend</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <div v-if="!app.user">
                                        <router-link :to="{ name: 'login' }" class="dropdown-item">Login</router-link>
                                        <router-link :to="{ name: 'register' }" class="dropdown-item">Register
                                        </router-link>
                                    </div>
                                    <a href="javascript:void(0)" v-else class="dropdown-item" @click="logout">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="row mt-5">
        <h3>dashboard</h3>
        <table class="table table-hover table-inverse">
            <thead>
            <tr>
                <th>Action</th>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>Categories</th>
                <th>Thumbnail</th>
                <th>When</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="article in articles" v-bind:key="article.id">
                <th scope="row"><button v-bind:id="article.id" class="btn btn-sm btn-info" style="color:white" v-on:click="editArticle(article)">edit</button></th>
                <td>{{ article.id }}</td>
                <td>{{ article.title }}</td>
                <td>{{ article.body }}</td>
                <td><ul v-for="cats in article.categories" v-bind:key="cats.id">
                    <li class="post-category cat-1 mb-1 pl-1" v-for="cat in cats" v-bind:key="cat.id" v-bind:style="{ backgroundColor: cat.color}"><span style="font-size: 11px; color: white">{{cat.title}}</span></li>
                </ul></td>
                <td><img v-bind:src="'storage/'+article.file_name" v-bind:alt="article.file_name" class="img-thumbnail"></td>
                <td>{{ article.created_at }}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</template>

<script>
    export default {
        name: "dashboard",
        props: ['app'],

        data() {
            return {
                articles: '',
                baseUrl: BASE_URL,
                categories: '',
                active_el: 0,
                articleToEdit: ''
            }
        },

        mounted() {
            if (!this.app.user)
            {
                this.app.$router.push({name:'login'});
            }else{
                this.getArticles();
                this.getCategories();
            }
        },

        filters: {
            shortTitle(value) {
                return value.length > 35 ? value.substring(0, 35) + '...' : value;
            }
        },

        methods: {
            getArticles() {
                let $this = this;
                this.app.loading = true;
                this.app.request.get('article/all').then(function (response) {
                    $this.app.loading = false;
                    $this.articles = response.data;
                    //console.log(response.data);
                })
            },
            clickPage(page) {
                let $this = this;
                this.app.request.get('article/' + this.articleId + '?page=' + page).then(function (response) {
                    if (response.data.id) {
                        $this.article = response.data;
                        $this.lastPage = response.data.threads.last_page;
                        $this.app.$router.replace({name: 'article', query: {page: page}});
                    }

                });
            },
            editArticle(article){
                let $this = this;
                //console.log(article);
                $this.app.$router.push({name: 'new-article', params: { articleToEdit: article }});
            },
            getCategories()
            {
                let $this = this;
                this.app.loading = true;
                this.app.request.get('categories').then(function (response) {
                    $this.app.loading = false;
                    //console.log("text" + response);
                    $this.categories = response.data;
                })
            },
            clickCateg(cat_id) {
                let $this = this;
                this.app.request.get('article/category/'+cat_id).then(function (response) {
                    $this.app.loading = false;
                    //console.log(response);
                    if (response.data)
                    {
                        $this.articles = response.data;
                        //console.log(response.data);
                        $this.active = true;
                    }
                });
                this.active_el = cat_id;

            },
            logout() {
                let $this = this;

                this.app.loading = true;

                this.app.request.post('auth/logout').then(function (response) {
                    $this.app.loading = false;
                    if (response.data === true) {
                        $this.app.user = null;
                        $this.app.$router.push({name: 'landing-page'});
                    }
                });
            },

        }
    }
</script>
<style scoped>
</style>
