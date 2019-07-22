<template>
    <div class="d-flex justify-content-center mt-5">
        <div class="card">
            <div class="card-header">
                New Article Form
            </div>
            <div class="card-block">
                <div class="col-12 mt-5 mb-5 pl-5 pr-5">
                    <h4 class="card-title">Add a new artical to DB.</h4>
                    <form v-on:submit.prevent="onSubmit">
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text"
                                    v-model="title"
                                    class="form-control"
                                    v-bind:class="{ 'is-invalid': errorTitle }"
                                    placeholder="Title of Article">
                            <div class="invalid-feedback">
                                {{ errorTitle }}
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Categories</label>
                            <ul>
                                <li v-for="category in categories">
                                    <input type="checkbox" v-model="user.roles" :value="category.id" :id="category.id">
                                    <label :for="category.id">{{ category.title }}</label>
                                </li>
                            </ul>
                            <!--                            <select v-model="category"
                                                                class="form-control"
                                                                v-bind:class="{ 'is-invalid': errorCategory }">
                                                            <option disabled value="">Please select one</option>
                                                            <option v-for="catTitle in catTitles" v-bind:value="catTitle.id">
                                                                {{catTitle.title}}
                                                            </option>
                                                        </select>-->
                            <!--<div class="invalid-feedback">
                                {{ errorCategory }}
                            </div>-->
                        </div>
                        <div class="form-group">
                            <label>Content</label>
                            <textarea v-model="content"
                                    class="form-control"
                                    v-bind:class="{ 'is-invalid': errorContent }"
                                    placeholder="content of post"></textarea>
                            <div class="invalid-feedback">
                                {{ errorContent }}
                            </div>
                        </div>
                        <button :disabled="app.loading" type="submit" class="btn btn-primary btn-group" disabled>Save and other</button>
                        <button :disabled="app.loading" type="submit" class="btn btn-primary btn-group">Save and close</button>
                    </form>
                </div>
            </div>
            <div class="card-footer text-muted">

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "new-article-frm",
        props: ['app'],
        data() {
            return {
                category_id: 1,
                title: '',
                categories: '',
                catTitles: '',
                errorTitle: '',
                errorCategory: '',
                successMessage: '',
                errorMessage: '',
                content: '',
                articleToEdit: '',
                errorContent: '',
                errors: []
            }
        },
        mounted() {
            let $this = this;
            if (!this.app.user)
            {
                this.app.$router.push({name:'login'});
            }
            this.getCategs($this);
            //console.log(this.toEdit);
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
            getCategs ($this) {
                this.app.request.get('categories').then(function (response) {
                    $this.app.loading = false;
                    $this.categories = response.data;
                    //console.log(response.data);
                });
            },
            onSubmit() {
                this.errors = [];
                let $this = this;
                if (!this.title && this.title.length < 6) {
                    this.errorTitle = 'Title min 6 chars.';
                    this.errors.push(this.errorTitle);
                } else {
                    this.errorTitle = null;
                }
                if (!this.content && this.content.length < 35) {
                    this.errorContent = 'Content min 35 chars.';
                    this.errors.push(this.errorContent);
                } else {
                    this.errorContent = null;
                }
                if (!this.errors.length) {
                    $this.app.loading = true;
                    let data = {
                        user_id: this.app.user.id,
                        //category_id: this.category,
                        featured: false,
                        picture: 5,
                        title: $this.title,
                        body: $this.content,
                    };
                    this.app.request.post('article/create-article', data).then(function (response) {
                        $this.app.loading = false;
                        if (response.data.id)
                        {
                            $this.successMessage = 'Article saved!';
                            alert($this.successMessage);
                            $this.app.$router.push({name:'dashboard'});
                        }
                        else if (!empty(response.data.error))
                        {
                            $this.errorMessage = 'Something went wrong.';
                            //console.log(response.data);
                        }
                    });
                }
            }
        }
    }
</script>

<style scoped></style>
