<template>
  {{ displayMinutes + ":" + displaySeconds }}
</template>

<script>
import { useRouter } from "vue-router";
import { useAuth } from '../store/auth.js';
export default {
  name: "LogOutCounter",
  data() {
    return {
      displayMinutes: null,
      displaySeconds: null,
      minutes: 30,
      seconds: 60,
    };
  },
  mounted() {
    const router = useRouter();
    for (let i = 0; i < this.minutes; i++) {
      setTimeout(() => {
        this.seconds = 60;
        this.minutes -= 1;

        if (this.minutes < 10) {
          this.displayMinutes = "0" + this.minutes;
        } else {
          this.displayMinutes = this.minutes;
        }

        for (let j = 0; j < this.seconds; j++) {
          const store = useAuth();
          setTimeout(() => {
            this.seconds -= 1;

            if (this.seconds < 10) {
              this.displaySeconds = "0" + this.seconds;
            } else {
              this.displaySeconds = this.seconds;
            }

            if (this.seconds == 0 && this.minutes == 0) {
              this.displaySeconds = "00";
              fetch("http://localhost:8881/api/logout", {
                method: "POST",
                headers: {
                  Accept: "application/json",
                  "Content-Type": "application/json",
                },
                credentials: "include",
              }).then((response) => {
                if (response.status < 300) {
                  store.logged = false;
                  router.push("/unauthorized");
                }
              });
            }
          }, j * 1000);
        }
      }, i * 60000);
    }
  },
};
</script>