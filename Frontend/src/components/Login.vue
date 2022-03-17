<template>
    <div>
        <LoginOrRegister></LoginOrRegister>
        <input type="text" placeholder="Felhasználónév">
        <input type="password" placeholder="Jelszó">
        <input type="submit" value="Login">
        <p>vagy</p>
        <p>
            <img src="#" alt="Google icon">
            Bejelntkezés Google fiókkal
        </p>
    </div>
</template>

<script>
import LoginOrRegister from "./LoginOrRegister.vue";
export default {
    components:{
        LoginOrRegister
    },
    mounted(){

    }
}
</script>