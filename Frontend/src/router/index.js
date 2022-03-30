import { createRouter, createWebHistory } from "vue-router";
import Login from "../views/LoginView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "login",
      component: Login,
      meta: {
        title: "5File | Bejelentkezés",
      }
    },
    {
      path: "/register",
      name: "register",
      component: () => import("../views/RegisterView.vue"),
      meta: {
        title: "5File | Regisztráció",
      }
    },
    {
      path: "/index",
      name: "index",
      component: () => import("../views/IndexView.vue"),
      meta: {
        title: "5File | Főoldal",
      }
    },
    {
      path: "/:pathMatch(.*)*",
      name: "notfound",
      component: () => import("../views/NotFoundPage.vue"),
      meta: {
        title: "5File | 404",
      }
    },
  ],
});

router.beforeEach((to, from, next) => {
  document.title = `${to.meta.title}`;
  next();
})

export default router;
