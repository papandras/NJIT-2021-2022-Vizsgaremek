import { createRouter, createWebHistory } from "vue-router";
import Login from "../views/LoginView.vue";
import { useAuth } from '../store/auth.js';
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "login",
      component: Login,
      meta: {
        title: "5File | Bejelentkezés",
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: () => import("../views/RegisterView.vue"),
      meta: {
        title: "5File | Regisztráció",
        requiresAuth: false
      }
    },
    {
      path: "/index",
      name: "index",
      component: () => import("../views/IndexView.vue"),
      meta: {
        title: "5File | Főoldal",
        requiresAuth: true,
        requiredRole: "none"
      }
    },
    {
      path: "/unauthorized",
      name: "unauthorized",
      component: () => import("../views/UnAuthorized.vue"),
      meta: {
        title: "5File | Nem jelenzkeztél be",
        requiresAuth: false,
        requiredRole: "none"
      }
    },
    {
      path: "/:pathMatch(.*)*",
      name: "notfound",
      component: () => import("../views/NotFoundPage.vue"),
      meta: {
        title: "5File | 404",
        requiresAuth: true,
        requiredRole: "none"
      }
    },
  ],
});

router.beforeEach((to, from, next) => {
  const store = useAuth();
  document.title = `${to.meta.title}`;
  if(to.meta.requiresAuth && !store.logged){
    router.replace('/unauthorized');
    setTimeout(() => {router.replace('/')}, 5000);
  }
  else{
    next();
  }
})

export default router;
