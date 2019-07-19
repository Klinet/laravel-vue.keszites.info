<template>
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
                        <ul class="nav-menu nav navbar-nav" v-if="!app.user">
                            <li class="cat-1"><a href="">Web Design</a></li>
                            <li class="cat-2"><a href="">JavaScript</a></li>
                            <li class="cat-3"><a href="">Css</a></li>
                        </ul>
                        <ul class="nav-menu nav navbar-nav" v-else>
                            <li class="cat-1"><router-link :to="{ name: 'new-article' }" class="dropdown-item">New article</router-link></li>
                            <li class="cat-2"><router-link :to="{ name: 'dashboard' }" class="dropdown-item">Dashboard</router-link></li>
                            <li class="cat-3"><router-link :to="{ name: 'photo-upload' }" class="dropdown-item">Photo</router-link></li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span v-if="app.user">{{ app.user.name }}</span>
                                    <span v-else>Backend</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <div v-if="!app.user">
                                        <router-link :to="{ name: 'login' }" class="dropdown-item">Login</router-link>
                                        <router-link :to="{ name: 'register' }" class="dropdown-item">Register</router-link>
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
</template>
<script>
    export default {
        name: "navbar",
        props: ['app'],
        methods: {
            logout() {
                let $this = this;

                this.app.loading = true;

                this.app.request.post('auth/logout').then(function (response) {
                    $this.app.loading = false;
                    if (response.data === true) {
                        $this.app.user = null;
                        $this.app.$router.push({name:'landing-page'});
                    }
                });
            },
            mounted()
            {
            }
        }
    }
</script>

<style scoped>

</style>
