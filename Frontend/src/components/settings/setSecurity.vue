<template>
  <div>
    <input type="password" name="confirm" id="confirm" placeholder="Jelszó módosítása" class="input"
      v-model="password" />
    <input type="button" value="Fiók törlése" class="button" v-if="store.user.role != 'admin'" @click="removeaccount" />
    <sup>Ez a művelet nem visszavonható!</sup>
  </div>
</template>

<style scoped>
div {
  height: 200px;
  padding-top: 10px;
}

* {
  display: block;
}

.button {
  background-color: #DC143C;
  width: 300px;
  margin: 5px;
}

.button:hover+sup {
  visibility: visible;
}

.input {
  background-color: #c4c4c4;
  opacity: 80%;
  border-radius: 5px;
  border-color: none;
  width: 300px;
  height: 30px;
  text-align: center;
  border: none;
  margin-top: 10px;
  margin-bottom: 10px;
  outline: none;
}

sup {
  color: red;
  letter-spacing: 1px;
  width: 300px;
  text-align: center;
  visibility: hidden;
}
</style>

<script>
import { useAuth } from "../../store/auth.js";
import axios from "axios";
import { useRouter } from "vue-router";
export default {
  data() {
    return {
      password: null,
      store: useAuth(),
      router: useRouter()
    }
  },
  props: {
    changedsettings: FormData
  },
  methods: {
    removeaccount() {
      let conf = confirm("Biztosan törölni akarod a fiókodat?")

      if (conf) {
        axios.delete(`http://localhost:8881/api/user/delete`, { withCredentials: true })
          .then(response => {
            this.store.logged = false;
            this.router.push("/");
          })
      }
    }
  },
  watch: {
    password(newdata, olddata) {
      this.changedsettings.append('pasword', newdata)
      if (newdata == null || newdata == "") {
        this.changedsettings.delete('pasword')
      }
    }
  }
}
</script>