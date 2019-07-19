<template>
    <div class="container">
        <spinner v-if="app.loading"></spinner>
        <div class="row">
            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6" v-for="article in articles" v-bind:key="article.id">
                            <div class="post post-thumb" v-if="article.featured == 1">
                                <div class="photo" style="width: 555px; height: 333px; overflow: hidden">
                                    <a class="post-img" href="/"><img v-bind:src="baseUrl+'/storage/'+article.file_name" alt="" class="img-fluid"></a>
                                </div>
                                <div class="post-body">
                                    <div class="post-meta">
                                        <a class="post-category cat-1" href="/">Web Design</a>
                                        <span class="post-date">March 27, 2018</span>
                                    </div>
                                    <h3 class="post-title"><a href="/">{{ getBody(article) }}</a></h3>
                                </div>
                            </div>
                        </div>
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
            <div class="col-md-4" v-for="article in articles" v-bind:key="article.id">
                <div class="post">
                    <div class="photo" style="width: 290px; height: 175px; overflow: hidden">
                        <a class="post-img" href="/"><img v-bind:src="baseUrl+'/storage/'+article.file_name" alt="" class="img-fluid"></a>
                    </div>
                    <div class="post-body">
                        <div class="post-meta">
                            <a class="post-category cat-1" href="/">Web Design</a>
                            <span class="post-date">March 27, 2018</span>
                        </div>
                        <h3 class="post-title"><a href="/">{{ getBody(article) }}</a></h3>
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
    //import Infinityscroll from '../components/scroll';
    export default {
        name: "landing-page",
        //components: {Infinityscroll},
        props: ['app'],
        data()
        {
            return {
                categories: null,
                articles: '',
                featured_articles: '',
                more_article: [],
                picture: '',
                catId: this.app.$route.params.id,
                baseUrl: BASE_URL,
                lastPage: 0,
                currentPage: this.app.$route.query.page ? this.app.$route.query.page : 1,
            }
        },


        filters: {
        },
        created()
        {
            //console.log("landing-page");
        },
        mounted()
        {
            let $this = this;
            this.getArticlesToLanding($this);
            $this.app.$router.replace({name: ''});
        },
        methods:
        {
            getArticlesToLanding($this){
                this.app.request.get('article').then(function (response) {

                    $this.app.loading = false;
                    if (response.data)
                    {
                        $this.articles = response.data;
                        //console.log(response.data);
                    }

                });
            },
            getBody (article) {
                let body = this.stripTags(article.body);
                return body.length > 100 ? body.substring(0, 100) + '...' : body;
            },
            stripTags (text) {
                return text.replace(/(<([^>]+)>)/ig, '');
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
        }
    }
</script>

<style scoped>

</style>
