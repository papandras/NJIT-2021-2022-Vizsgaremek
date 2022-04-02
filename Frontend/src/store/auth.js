import { defineStore } from "pinia";

export const useAuth = defineStore("authStore",{
    state(){
        return{
            logged: false,
            user: null
        }
    }
})