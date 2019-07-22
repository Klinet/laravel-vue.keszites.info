import Landing from './pages/landing-page';
import Login from './pages/login';
import Register from './pages/register';
import Dashboard from './pages/dashboard';
import NewArticle from './pages/new-article-frm';
import PhotoUpload from './pages/photos';

const routes = [
    { path: '/', component: Landing, name: 'landing-page' },
    { path: '/article/:id?', component: Landing, name: 'article' },
    { path: '/article/category/:id?', component: Landing, name: 'category', props: ['id'] },

    { path: '/dashboard', component: Dashboard, name: 'dashboard' },
    { path: '/new-article/:id?', component: NewArticle, name: 'new-article' },
    { path: '/photo-upload', component: PhotoUpload, name: 'photo-upload' },

    { path: '/register', component: Register, name: 'register' },
    { path: '/login', component: Login, name: 'login' },

    { path: '*', redirect: '/' }
];

export default routes;
