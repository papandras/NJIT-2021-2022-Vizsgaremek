<template>
  <div id="datas">
    <img :src="'http://localhost:8881/profilpic/' + store.user.profilpic" alt="Profilkép" title="Profilkép" />
    <label>Új kép feltöltése</label>
    <div class="file">
      <input type="file" id="profilpicinput" @change="addfile" />
      <input type="checkbox" id="checkbox" v-model="removepic" v-if="store.user.profilpic != 'base-notfound.svg'"><label for="checkbox" v-if="store.user.profilpic != 'base-notfound.svg'">Jelenlegi törlése</label>
    </div>
    <input type="email" placeholder="E-mail cím" class="input" v-model="email" />
  </div>
</template>

<style scoped>
img {
  height: 200px;
}

#datas {
  height: fit-content;
}

div>* {
  display: block;
  padding-left: 15px;
  padding-right: 15px;
  padding-bottom: 15px;
  padding-top: 8px;
}

.file>* {
  display: inline;
}

.file>input[type=file] {
  padding-left: 0;
}

.input {
  all: initial;
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
</style>

<script>
import { useAuth } from "../../store/auth.js";
export default {
  props: {
    changedsettings: FormData
  },
  data() {
    return {
      profilpic: null,
      email: null,
      store: useAuth(),
      removepic: false
    }
  },
  methods: {
    addfile() {
      this.profilpic = document.getElementById("profilpicinput").files[0]
    }
  },
  watch: {
    profilpic(newfile, oldfile) {
      this.changedsettings.append('profilpic', newfile);
      if (newfile == null) {
        this.changedsettings.delete('profilpic')
      }
    },
    email(newdata, olddata) {
      this.changedsettings.append('email', newdata);
      if (newdata == null || newdata == "") {
        this.changedsettings.delete('email')
      }
    },
    removepic(newdata, olddata) {
      this.changedsettings.append('removepic', newdata);
      if (newdata == false) {
        this.changedsettings.delete('removepic')
      }
    }
  }
}
</script>