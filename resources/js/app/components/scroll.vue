<template>
    <div class="infinite-wrapper">
        <div style="overflow: auto;">
            <infinite-loading force-use-infinite-wrapper="true" @distance="1" @infinite="infiniteHandler"></infinite-loading>
        </div>
        <ul id="v-for-object" class="demo">
            <li v-for="value in articles">
                {{ value }}
            </li>
        </ul>
        <div class="col-md-4" v-for="article in articles" v-bind:key="article.id">
            <div class="post">
                <a class="post-img" href="blog-post.html"><img v-bind:src="article.picture" alt=""></a>
                <div class="post-body">
                    <div class="post-meta">
                        <a class="post-category cat-1" href="category.html">Web Design</a>
                        <span class="post-date">March 27, 2018</span>
                    </div>
                    <h3 class="post-title"><a href="blog-post.html">{{ getBody(article.body) }}</a></h3>
                </div>
            </div>
        </div>
    <div class="container h-100">
        <div class="row h-100 justify-content-center align-items-center">
            <button class="btn btn-primary text-uppercase grey-dark">LOAD MORE</button>

        </div>
    </div>
    </div>
<!--    <div class="infinite-wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <h2>Recent Posts</h2>
                </div>
            </div>
            <infinite-loading @distance="1" @infinite="infiniteHandler"></infinite-loading>
            <div class="col-md-4" v-for="article in articles" v-bind:key="article.id">
                <div class="post">
                    <a class="post-img" href="blog-post.html"><img v-bind:src="article.picture" alt=""></a>
                    <div class="post-body">
                        <div class="post-meta">
                            <a class="post-category cat-1" href="category.html">Web Design</a>
                            <span class="post-date">March 27, 2018</span>
                        </div>
                        <h3 class="post-title"><a href="blog-post.html">{{ getBody(article.body) }}</a></h3>
                    </div>
                </div>
            </div>
        </div>

    </div>-->
</template>

<script>
    export default {
        name: "infinityscroll",
        props: ['app'],
        data() {
            return {
                list: [],
                page: 1,
                categories: null,
                articles: '',
                picture: '',
            };
        },
        mounted()
        {
            console.log('Component mounted.');
        },
        methods: {
            infiniteHandler($state) {


            },
            getBody (article_body) {
                let body = this.stripTags(article_body);
                return body.length > 100 ? body.substring(0, 100) + '...' : body;
            },
            stripTags (article_body) {
                return article_body.replace(/(<([^>]+)>)/ig, '');
            }
        },
    }
</script>

<style scoped>

</style>
