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
                            <ul class="nav-menu nav navbar-nav" v-if="!app.user" style="display: contents">
                                <li :class="'cat-' + category.id" v-for="category in categories" v-bind:key="category.id"><a @click="clickCateg(category.id)" :class="{ active : active_el == category.id }">{{category.title}}</a></li>
                            </ul>
                            <ul class="nav-menu nav navbar-nav" v-else style="display: contents">
                                <li class="cat-1">
                                    <router-link :to="{ name: 'new-article' }" class="dropdown-item">New article
                                    </router-link>
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
        <spinner v-if="app.loading"></spinner>
        <div class="row">
            <div class="col-6" v-for="(item,index) in article" v-if="item.featured == 1 && index <= 1">
                <div class="post post-thumb" style="">
                    <div class="photo" style="max-height: 330px; overflow: hidden">
                        <a class="post-img" href="/"><img v-bind:src="baseUrl+'/storage/'+item.file_name" alt="" class="img-fluid"></a>
                    </div>
                    <div class="post-body">
                        <div class="post-meta">
                            <span class="post-date shadowed_text">{{item.created_at}}</span>
                            <div v-for="cats in item.categories" v-bind:key="cats.id">
                                <a class="post-category cat-1" v-for="cat in cats" v-bind:key="cat.id" v-bind:style="{ backgroundColor: cat.color,}">{{cat.title}}</a>
                            </div>
                        </div>
                        <h3 class="post-title shadowed_text">{{ item.body|truncate(60) }}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2>Recent Posts</h2>
                </div>
            </div>
            <div class="col-md-4" v-for="item in article" v-bind:key="item.id">
                <div class="post">
                    <div class="photo" style="width: 290px; height: 175px; overflow: hidden">
                        <a class="post-img" href="/"><img v-bind:src="baseUrl+'/storage/'+item.file_name" alt="" class="img-fluid"></a>
                    </div>
                    <div class="post-body">
                        <div class="post-meta">
                            <span class="post-date">{{item.created_at}}</span>
                            <div v-for="cats in item.categories" v-bind:key="cats.id">
                                <a class="post-category cat-1" v-for="cat in cats" v-bind:key="cat.id" v-bind:style="{ backgroundColor: cat.color,}">{{cat.title}}</a>
                            </div>
                        </div>
                        <h3 class="post-title">{{ item.body|truncate(120) }}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="container h-100">
            <div class="row h-100 justify-content-center align-items-center">
                <pagination :total-pages="lastPage"
                        :page="currentPage"
                        :app="app"
                        style="margin-top: 20px"
                        :on-click-page="clickPage">
                </pagination>
            </div>
        </div>
        <footer id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="footer-widget">
                            <div class="footer-logo">
                                <a href="index.html" class="logo"><img src="img/logo.png" alt=""></a>
                            </div>
                            <ul class="footer-nav">
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Advertisement</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="footer-widget">
                                    <h3 class="footer-title">About Us</h3>
                                    <ul class="footer-links">
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="#">Join Us</a></li>
                                        <li><a href="contact.html">Contacts</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </div>
        </footer>
    </div>
</template>

<script>

    export default {
        name: "landing-page",
        props: ['app'],
        data()
        {
            return {
                baseUrl: BASE_URL,
                categories: '',
                active_el: 0,
                article: '',
                more_article: [],
                lastPage: '',
                currentPage: '',
            }
        },
        filters: {
        },
        created()
        {
            let $this = this;
            if (this.app.user)
            {
                this.app.$router.push({name:'dashboard'});
            }
        },
        mounted()
        {
            let $this = this;
            this.getArticlesToLanding($this);
            this.getCategories($this);
            $this.app.$router.replace({name: ''});
            this.$root.$on('nav', () => {
                this.clickCateg()
            });
        },
        filters: {
            truncate: function(value, limit) {
                if (value.length > limit) {
                    value = value.substring(0, (limit - 3)) + '...';
                }
                return value
            }
        },
        methods:
            {
                getArticlesToLanding($this){
                    this.app.request.get('article').then(function (response) {
                        $this.app.loading = false;
                        if (response.data)
                        {
                            $this.article = response.data;
                            //console.log($this.article);
                        }
                    });
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
                clickPage(page)
                {
                    let $this = this;
                    this.app.request.get('pagination/'+page).then(function (response) {
                        if (response)
                        {
                            $this.article = response;
                            $this.lastPage = response.data.last_page;
                            $this.app.$router.replace({name: 'article', query: { page: page-1 }});
                            $this.article.push(response.data);
                        }
                    });
                },
                clickCateg(cat_id) {
                    let $this = this;

                    this.app.request.get('article/category/'+cat_id).then(function (response) {
                        $this.app.loading = false;

                        if (response.data)
                        {
                            $this.article = response.data;
                            //console.log(response);
                            $this.active = true;
                        }
                    });
                    this.active_el = cat_id;

                }
            }
    }
</script>

<style scoped>
</style>
