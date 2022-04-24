<template>
  <div class="settings">
    <Menu id="menu" activepage="settings"></Menu>
    <div id="content">
      <div id="contentButtons">
        <div id="whiteBackground">
          <div id="left">
              <button id="dataButton" @click="displayDatas">Adatok</button>
              <button id="securityButton" @click="displaySecurity">Biztonság</button>
              <button class="button" id="save">Módosítások mentése</button>           
          </div>
          <div id="right">
              <Datas id="picturegrid" v-if="showdata"/>  
              <Security v-if="showsecurity" />  
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

export default {
  components: {
    Menu,
    Datas,
    Security
  },
  data() {
    return {
      showdata: true,
      showsecurity: false
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
    }
  }
};
</script>

<style scoped>
@import url("../assets/css/SettingsView.css");
</style>