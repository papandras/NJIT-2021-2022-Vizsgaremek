<template>
  <div class="settings">
    <Menu id="menu" activepage="settings"></Menu>
    <div id="content">
      <div id="contentButtons">
        <div id="whiteBackground">
          <div id="left">
              <button id="adatokGomb" @click="displayDatas">Adatok</button>
              <button id="biztonsagGomb" @click="displaySecurity">Biztonság</button>
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
.settings {
  display: grid;
  grid-template-columns: 10% 90%;
  grid-template-rows: 100%;
  grid-template-areas: "menu content";
}
#content {
  padding: 20px;
}

#whiteBackground {
  position: relative;
}

#save {
  position: absolute;
  right: 20px;
  bottom:  20px;
}

#right, #left {
  padding: 10px;
}
</style>

<style scoped>
@import url("../assets/css/SettingsView.css");
</style>