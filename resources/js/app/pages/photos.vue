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
        <div class="row mt-5">
            <form-upload :app="this"></form-upload>
        </div>
    </div>
</template>

<script>
    import FormUpload from '../components/formupload';
    import axios from 'axios';
    export default {
        name: "photos",
        components: {FormUpload},
        props: ['app'],
        data() {
            return {
                progressBar: 0,
                message: '',
                isLoading: false,
                file: '',
                files: [],
                baseUrl: BASE_URL
            }
        },
        created() {
            //this.getAllFile()
        },
        mounted() {
            let $this = this;
            if (this.app.user === null)
            {
                this.app.$router.push({name:'auth.login'});
            }
        },
        methods: {
            /*getAllFile() {
                axios.get(BASE_URL+'/photos/file')
                    .then((response) => {
                        this.files = response.data
                    })
            }*/
        }
    }
</script>

<style scoped>
</style>
