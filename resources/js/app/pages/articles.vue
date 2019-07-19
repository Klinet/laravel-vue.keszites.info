<template>
    <div>
        <spinner v-if="app.loading"></spinner>
        <div v-else-if="article">
            <div class="container">
                <div class="jumbotron">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <router-link :to="{ name: 'landing-page' }">Home</router-link>
                            </li>
                            <li class="breadcrumb-item">{{ article.title }}</li>
                        </ol>
                    </nav>

                    <h1 class="display-4">{{ article.title }}</h1>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div style="margin-bottom: 60px" v-if="app.user">
                            <a href="javascript:void(0)"
                                    @click="editArticle(article)"
                                    style="display: block"
                                    class="btn btn-lg btn-success float-right">
                                Edit
                            </a>
                        </div>

                    </div>
                    <div class="col-md-4">

                    </div>

                </div>

            </div>
        </div>

    </div>
</template>

<script>

    export default {
        name: "articles",
        props: ['app'],
        data() {
            return {
                articleId: this.app.$route.params.id,
                article: null,
                baseUrl: BASE_URL,
                articleToEdit: false,
                lastPage: 0,
                currentPage: this.app.$route.query.page ? this.app.$route.query.page : 1,

            }
        },

        mounted() {
            let $this = this;
            this.getArticles();
        },

        filters: {
            shortTitle(value) {
                return value.length > 35 ? value.substring(0, 35) + '...' : value;
            }
        },

        methods: {
            getArticles() {
                let $this = this;
                this.articleId = 1;
                this.app.loading = true;
                this.app.request.get('article/' + this.articleId).then(function (response) {
                    $this.app.loading = false;
                    if (response.data.id) {
                        $this.article = response.data;
                    }
                })
            },

            featuredArticle(article) {
                this.app.store.commit('setCurrentArticle', articles);
            }

        }
    }
</script>

<style scoped></style>
