<template>
  <div class="shared">
    <Menu id="menu" activepage="shared"></Menu>
    <div id="content">   
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
.shared {
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