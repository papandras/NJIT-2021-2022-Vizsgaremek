<template>
  <div class="login">
    <LoginPage></LoginPage>
  </div>
</template>

<script>
import LoginPage from "../components/Login.vue"

export default{
  name: "Login",
    components:{
        LoginPage
    }
}
</script>

<style scoped>
  LoginPage{
    display: block;
    margin: auto;
  }
</style>