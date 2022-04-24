<template>
  <div class="settings">
    <Menu id="menu" activepage="settings"></Menu>
    <div id="content">
      <div id="contentButtons">
        <div id="whiteBackground">
          <div id="left">
            <button id="dataButton" @click="displayDatas">Adatok</button>
            <button id="securityButton" @click="displaySecurity">Biztonság</button>
          </div>
          <div id="right">
            <ul v-if="errors != null" id="errorul">
              <li v-for="error in errors">
                <ul>
                  <li v-for="err in error">{{ err }}</li>
                </ul>
              </li>
            </ul>
            <form method="post" @submit.prevent="shavechanges" enctype="multipart/form-data">
              <Datas id="picturegrid" v-if="showdata" :changedsettings="settings" />
              <Security v-if="showsecurity" :changedsettings="settings" />
              <div id="save">
                <input type="password" name="confirm" id="confirm" placeholder="Jelszó megerősítése" class="input"
                  v-model="confirm" />
                <button class="button">Módosítások mentése</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import Datas from "../components/settings/setDatas.vue";
import Security from "../components/settings/setSecurity.vue";
import axios from "axios";
import { useAuth } from "../store/auth.js";

export default {
  components: {
    Menu,
    Datas,
    Security
  },
  data() {
    return {
      showdata: true,
      showsecurity: false,
      settings: new FormData(),
      errors: null,
      confirm: null,
      store: useAuth(),
    }
  },
  methods: {
    displayDatas() {
      this.showdata = true;
      this.showsecurity = false;
    },
    displaySecurity() {
      this.showdata = false;
      this.showsecurity = true;
    },
    async shavechanges() {
      try {
        await axios
          .post("http://localhost:8881/api/user/settings", this.settings, {
            withCredentials: true, Accept: "application/json"
          })
          .then(response => {
            if (response.status < 300) {
              axios
                .get("http://localhost:8881/api/user", { withCredentials: true })
                .then((response) => {
                  this.store.user = response.data;
                });
            }
          })
      }
      catch (e) {
        this.errors = e.response.data.errors;
      }
    }
  },
  watch: {
    confirm(newdata, olddata) {
      this.settings.append('confirm', newdata);
      if (newdata == null || newdata == "") {
        this.changedsettings.delete('confirm')
      }
    }
  }
};
</script>

<style scoped>
@import url("../assets/css/SettingsView.css");
</style>