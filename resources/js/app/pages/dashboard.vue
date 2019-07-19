<template>
<div class="container">
    <div class="row mt-5">
        <h3>dashboard</h3>
        <table class="table table-hover table-inverse">
            <thead>
            <tr>
                <th>Action</th>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
                <th>Thumbnail</th>
                <th>When</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="article in articles" v-bind:key="article.id">
                <th scope="row"><button v-bind:id="article.id" v-bind:name="article.id" class="btn btn-sm btn-info" style="color:white" v-on:click="editArticle(article)">edit</button></th>
                <td>{{ article.id }}</td>
                <td>{{ article.title }}</td>
                <td>{{ article.body }}</td>
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
                //articleId: this.app.$route.params.id,
                articles: '',
                baseUrl: BASE_URL,
                lastPage: 0,
                articleToEdit: '',
                currentPage: this.app.$route.query.page ? this.app.$route.query.page : 1,
            }
        },

        mounted() {
            if (!this.app.user)
            {
                this.app.$router.push({name:'login'});
            }else{
                this.getArticles();
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

            },
            goToCreate(article) {
                this.app.store.commit('setCurrentArticle', article);
            }

        }
    }
</script>
<style scoped>
</style>
