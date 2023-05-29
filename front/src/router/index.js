import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/Home.vue"
import About from "../views/About.vue"
import Api from "../views/Api.vue"

const routes = [
    { path: "/", component: Home },
    { path: "/about", component: About },
    { path: "/api", component: Api }
];

const history = createWebHistory();

const router = createRouter({
    history,
    routes,
});

export default router;