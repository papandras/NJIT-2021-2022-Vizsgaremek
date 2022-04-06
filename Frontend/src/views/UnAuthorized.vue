<template>
  <h1>Az oldal megtekintéséhez be kell jelentkezned!</h1>
  <h1 id="counter" v-text="counter"></h1>
</template>

<script>
import { useRouter } from "vue-router";
export default {
  data() {
    return {
      counter: 5,
    };
  },
  mounted() {
    const router = useRouter();
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