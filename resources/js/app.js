require('./bootstrap');
window.moment = require('moment');
window.Vue = require('vue');

import routes from './app/routes';
import VueRouter from 'vue-router';
import Vuex from 'vuex';
import Store from './app/store';
import Pagination from './app/plugins/pagination';
import VueResource from 'vue-resource';
import 'nprogress/nprogress.css';
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'


Vue.use(Vuex);
Vue.use(VueRouter);
Vue.use(Pagination);
Vue.use(VueResource);
Vue.component('spinner', require('vue-simple-spinner'));
Vue.use(BootstrapVue);

const router = new VueRouter({
    routes: routes
});
const store = new Vuex.Store(Store);
const app = require('./app/app.vue');

new Vue({
    router: router,
    store: store,
    render: h => h(app)
}).$mount('#app');
