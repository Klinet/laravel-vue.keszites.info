<template>
    <div class="container">
        <header>
            <div>
                <b-navbar type="dark" variant="dark">
                    <b-navbar-nav>
                        <b-nav-item><router-link :to="{ name: 'dashboard' }" class="nav-link logo">Vissza</router-link></b-nav-item>
                    </b-navbar-nav>
                </b-navbar>
            </div>
        </header>
        <div class="mt-5">
            <div class="row">
                <div class="col-5">
                    <div class="card">
                    <div class="card-header">
                        {{ formTitle }}
                    </div>
                    <div class="card-block">
                        <!--<p>{{article}} </p>-->
                        <div class="col-12 mt-5 mb-5 pl-5 pr-5">
                            <form v-on:submit.prevent="onSubmit">
                                <fieldset class="mb-5">
                                    <legend>{{ formTitle }}</legend>
                                    <hr>
                                </fieldset>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input type="text"
                                            v-model="article.title"
                                            class="form-control"
                                            v-bind:class="{ 'is-invalid': errorTitle }"
                                            placeholder="Title of Article"
                                            v-model.lazy="article.title">
                                    <div class="invalid-feedback">
                                        {{ errorTitle }}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Content</label>
                                    <textarea v-model="article.body"
                                            class="form-control"
                                            v-bind:class="{ 'is-invalid': errorContent }"
                                            placeholder="content of post"
                                            v-model.lazy="article.body">></textarea>
                                    <div class="invalid-feedback">
                                        {{ errorContent }}
                                    </div>
                                </div>

                                <fieldset class="mb-5">
                                    <legend>Categories:</legend>
                                    <hr>
                                    <div class="form-check form-check-inline" v-for="availableCat in availableCats" v-bind:key="availableCat.id">
                                        <li style="list-style-type: none">
                                            <input class="form-check-input" type="checkbox" v-model="selected_categories" :value="availableCat.id">
                                            <label class="form-check-label" :for="availableCat.id">{{availableCat.id}}: {{ availableCat.title }}</label>
                                        </li>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <h3>Featured:</h3>
                                    <b-form-group label="choose one please">
                                        <b-form-radio v-model="article.featured" name="some-radios" value="1">Yes</b-form-radio>
                                        <b-form-radio v-model="article.featured" name="some-radios" value="0">Nope</b-form-radio>
                                    </b-form-group>
                                </fieldset>
                                <hr>
                                <hr>
                                <button :disabled="app.loading" type="submit" class="btn btn-primary btn-group" disabled>
                                    Save and other
                                </button>
                                <button :disabled="app.loading" type="submit" class="btn btn-primary btn-group">Save and
                                    close
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer text-muted">

                    </div>
                </div>
                </div>
                <div class="col-5">
                    <div class="card">
                    <div class="card-header">
                        Preview
                    </div>
                    <div class="card-block">
                        <div class="col-12 mt-5 mb-5 pl-5 pr-5">
                            <fieldset class="mb-5">
                                <legend><h3>Preview:</h3></legend>
                                <img v-bind:src="'storage/'+article.file_name" v-bind:alt="article.file_name" class="img-thumbnail">
                                <hr>
                                <h5>Article title:</h5>
                                <p>{{article.title}}</p>
                                <hr>
                                <h5>Article body:</h5>
                                <p>{{article.body}}</p>
                                <hr>
                                <h5>Recent categories:</h5>
                                <div v-for="item in article.categories">
                                    <h5 v-for="cat in item" v-bind:key="cat.id">
                                        {{cat.id}}: {{ cat.title }}
                                    </h5>
                                </div>
                                <hr>
                                <h5>Selected categories:</h5>
                                <ul>
                                    <li v-for="category in selected_categories">{{ category }}</li>
                                </ul>
                                <hr>
                                <h4>Featured?</h4>
                                <div class="mt-3">Selected: <strong>{{ article.featured }}</strong></div>

                            </fieldset>
                        </div>
                    </div>
                    <div class="card-footer text-muted">

                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</template>

<script>
    import { LayoutPlugin } from 'bootstrap-vue';

    export default {
        name: "new-article-frm",
        props: ['app'],
        components: {LayoutPlugin},
        data() {
            return {
                user_id: '',
                article_id: '',
                article: {
                    id: '',
                    title: '',
                    body: '',
                    file_name: '',
                    category_id: '',
                    featured: '',
                    created_at: '',
                    cat_title: '',
                    cat_id: '',
                    picture: '',
                    categories: []
                },
                availableCats: [],
                selected_categories: [],
                categs: '',
                featured: '',
                formTitle: "New Article Form",
                errorTitle: '',
                errorCategory: '',
                content: '',
                errorContent: '',
                errors: [],
                errorMessage: '',
                successMessage: ''
            }
        },
        created() {
            let $this = this;
            if (this.$route.params.articleToEdit) {
                //console.log(response.data);
                $this.article = this.$route.params.articleToEdit;
                console.log($this.article);
                $this.formTitle = "Article Editing Form";
            }
        },
        mounted() {
            let $this = this;
            if (!this.app.user)
            {
                this.app.$router.push({name:'login'});
            }else{
                $this.user_id = this.app.user.id;
                this.getCategories($this);
            }
        },
        filters: {
            shortTitle(value) {
                return value.length > 6 ? value.substring(0, 6) + '...' : value;
            },
            shortContent(value) {
                return value.length > 35 ? value.substring(0, 35) + '...' : value;
            }
        },
        methods: {
            getCategories($this) {
                this.app.request.get('categories').then(function (response) {
                    $this.app.loading = false;
                    $this.availableCats = response.data;
                });
            },
            onSubmit() {
                let $this = this;
                this.errors = [];
                //validálás
                if (!this.errors.length) {
                    $this.app.loading = true;
                    if ($this.selected_categories == null) {
                        let a=["1"];
                        $this.categs = a;
                    }
                    console.log($this.categs);
                    let data = {
                        //article_id: $this.article.id,
                        user_id: $this.user_id,
                        categories: $this.categs,
                        featured: $this.article.featured,
                        picture: $this.article.file_name,
                        title: $this.article.title,
                        body: $this.article.body,
                    };

                    console.log(data);

                    if ($this.article.id == ''){
                        console.log("new_article: ");

                        this.app.request.post('article/create-article', data).then(function (response) {
                            $this.app.loading = false;
                            console.log(response);
                            if (response.data.id)
                            {
                                $this.successMessage = 'Article saved!';
                                alert($this.successMessage);
                                $this.app.$router.push({name:'dashboard'});
                            }
                            else if (!empty(response.data.error))
                            {
                                $this.errorMessage = 'Something went wrong.';
                            }
                        });
                    }else{
                        console.log("exist_article_editable: " + $this.article.id);
                        data.article_id = $this.article.id;
;
                        this.app.request.post('article/update-article', data).then(function (response) {
                            $this.app.loading = false;
                            console.log(response);
                            if (response.data.id)
                            {
                                $this.successMessage = 'Updated!';
                                alert($this.successMessage);
                                $this.app.$router.push({name:'dashboard'});
                            }
                            else if (!empty(response.data.error))
                            {
                                $this.errorMessage = 'Something went wrong.';
                            }
                        });
                    }
                }
            }
        }
    }
</script>

<style>
    #checkboxes label {
        display: inline-block;
    }

    #checkboxes input {
        display: inline-block;
        margin-right: 10px;
    }
</style>
