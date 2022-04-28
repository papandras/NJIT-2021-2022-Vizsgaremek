<template>
  <h1>Az oldal megtekintéséhez be kell jelentkezned!</h1>
  <h1 id="counter" v-text="counter"></h1>
</template>

<script>
import { useRouter } from "vue-router";
import { useAuth } from '../store/auth.js';
export default {
  data() {
    return {
      counter: 5,
    };
  },
  mounted() {
    const router = useRouter();
    const store = useAuth();
    store.logged = false;
    for (let i = 1; i <= 5; i++) {
      setTimeout(() => {
        this.counter -= 1;
        if(this.counter == 0){
          router.push("/");
        }
      }, i * 1000);
    }
  },
};
</script>

<style scoped>
  h1:first-child{
    padding-top: 150px;
  }

 h1 {
    text-align: center;
    top: 50%;
    font-size: 120%;
    letter-spacing: 2px;
    text-transform: uppercase;
    opacity: 0.3;
 }

 #counter{
   font-size: 500%;
 }
</style>