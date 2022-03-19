<template>
    <div>
        <LoginOrRegister></LoginOrRegister>
        <input type="text" placeholder="Felhasználónév">
        <input type="email" placeholder="E-mail cím">
        <input type="password" placeholder="Jelszó">
        <input type="password" placeholder="Jelszó megerősítés">
        <input type="submit" value="Regisztrálok">
        <p>vagy</p>
        <button>
            <img src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png" style="height: 20px" alt="Google icon">
            Regisztráció Google fiókkal
        </button>
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