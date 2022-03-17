<template>
    <div>
        <LoginOrRegister></LoginOrRegister>
        <input type="text" placeholder="Felhasználónév">
        <input type="email" placeholder="E-mail cím">
        <input type="password" placeholder="Jelszó">
        <input type="password" placeholder="Jelszó megerősítés">
        <input type="submit" value="Regisztrálok">
        <p>vagy</p>
        <p>
            <img src="#" alt="Google icon">
            Regiszráció Google fiókkal
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