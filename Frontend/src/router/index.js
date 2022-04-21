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
      path: "/myfiles",
      name: "myfiles",
      component: () => import("../views/MyFilesView.vue"),
      meta: {
        title: "5File | Saját fájlok",
        requiresAuth: true,
        requiredRole: "none"
      }
    },
    {
      path: "/shared",
      name: "shared",
      component: () => import("../views/SharedView.vue"),
      meta: {
        title: "5File | Velem megosztott fájlok",
        requiresAuth: true,
        requiredRole: "none"
      }
    },
    {
      path: "/users",
      name: "users",
      component: () => import("../views/UsersView.vue"),
      meta: {
        title: "5File | Felhasználók",
        requiresAuth: true,
        requiredRole: "none"
      }
    },
    {
      path: "/settings",
      name: "settings",
      component: () => import("../views/SettingView.vue"),
      meta: {
        title: "5File | Beállítások",
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
      path: "/logout",
      name: "logout",
      component: () => import("../views/LogoutPage.vue"),
      meta: {
        title: "5File | Kijelentkezés",
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
  else if(store.logged && (to.path == '/' || to.path == "/register")){
    router.replace('/index');
  }
  else{
    next();
  }
})

export default router;
