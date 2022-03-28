<template>
  <div>
    <div id="success"></div>
    <LoginOrRegister></LoginOrRegister>
    <form>
      <input type="text" placeholder="Felhasználónév" />
      <input type="password" placeholder="Jelszó" />
      <input type="submit" value="Bejelentkezek" @click="Login" />
      <!--<RouterLink to="/index"><input type="submit" value="Bejelentkezek" @click="Login"></RouterLink>-->
    </form>
    <p>vagy</p>
    <button>
      <img
        src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png"
        style="height: 20px"
        alt="Google icon"
      />
      Bejelntkezés Google fiókkal
    </button>
  </div>
</template>

<script>
import LoginOrRegister from "./LoginOrRegister.vue";
export default {
  components: {
    LoginOrRegister,
  },
  methods: {
    Login() {
      alert("Bejelentkeztél");
    },
  },
  mounted() {},
};
</script>