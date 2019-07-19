<template>
    <div class="d-flex justify-content-center">
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
                            <label>Category</label>
                            <select v-model="category"
                                    class="form-control"
                                    v-bind:class="{ 'is-invalid': errorCategory }">
                                <option disabled value="">Please select one</option>
                                <option v-for="catTitle in catTitles" v-bind:value="catTitle.id">
                                    {{catTitle.title}}
                                </option>
                            </select>
                            <div class="invalid-feedback">
                                {{ errorCategory }}
                            </div>
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
    import axios from 'axios'

    export default {
        name: "new-article-frm",
        props: ['app'],
        //props: ['app', 'toEdit'],
        data() {
            return {
                category_id: '',
                title: '',
                category: '',
                catTitles: '',
                errorTitle: '',
                errorCategory: '',
                successMessage: '',
                errorMessage: '',
                content: '',
                errorContent: '',
                progressBar: 0,
                message: '',
                uploaded_photo: null,
                isLoading: false,
                file: '',
                files: [],
                baseUrl: BASE_URL,
                uploaded_photo_id: '',
                new_article: '',
                errors: []
            }
        },


        created() {
            let $this = this;
        },

        mounted() {
            if (!this.app.user)
            {
                this.app.$router.push({name:'login'});
            }
            this.getCategs();
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
            getCategs () {
                let $this = this;
                axios.get( 'categories/all')
                    .then((response) => {
                        $this.catTitles = response.data;
                        //console.log(this.catTitles);
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

                    $this.isLoading = true;
                    $this.message = '';

                    let data = {
                        user_id: 1,
                        category_id: $this.category,
                        picture: 5,
                        title: $this.title,
                        body: $this.content,
                    };

                    this.app.request.post('article/create-article', data).then(function (response) {

                        $this.app.loading = false;

                        if (response.data.id) {
                            $this.new_article = response.data;
                            $this.app.$router.push({name: 'dashboard'});
                        } else if (response.data.error) {
                            console.log(response.data.error);
                        }

                        console.log(data);
                    });
                }
            },
            reset() {
                this.$refs.file.value = '';
            }
        }
    }
</script>

<style scoped></style>
