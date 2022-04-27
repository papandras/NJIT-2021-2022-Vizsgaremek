import { defineStore } from "pinia";

const checkLogged = () => {
    if (decodeURI(document.cookie.split('=')[1]) != "undefined") {
        return true;
    }
    else {
        return false;
    }
}

export const useAuth = defineStore("authStore", {
    state() {
        return {
            logged: checkLogged(),
            user: {
                id: null,
                name: "default",
                email: null,
                profilpic: "base-notfound.svg"
            }
        }
    }
})