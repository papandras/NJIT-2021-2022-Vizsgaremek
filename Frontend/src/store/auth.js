import { defineStore } from "pinia";

const checkLogged = () => {
    if(decodeURI(document.cookie.split('=')[1]) != "undefined"/* && decodeURI(document.cookie.split('=')[0] == "jwt")*/){
        return true;
    }
    else{
        return false;
    }
}

export const useAuth = defineStore("authStore",{
    state(){
        return{
            logged: checkLogged(),
            user: null
        }
    },
    actions:{
        
    }
})