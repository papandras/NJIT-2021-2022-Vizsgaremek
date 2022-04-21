<template>
  <div class="settings">
    <Menu id="menu" activepage=""></Menu>
    <div id="content">
      <div id="contentButtons">
        <div id="whiteBackground">
          <div id="left">
              <button id="adatokGomb">Adatok</button>
              <button id="ertesitesekGomb">Értesítések</button>
              <button id="biztonsagGomb">Biztonság</button>
              <button id="rolunkGomb">Rólunk</button>
              <button id="modositasMentesGomb">Módosítások mentése</button>           
          </div>
          <div id="right">
              <button id="profilKepModositasGomb">Profilkép módosítás</button>
              <button id="fiokTorleskGomb">Fiók törlés</button>
              <button id="jelszoModositasGomb">Jelszó módosítás</button>
              <button id="regiJelszoGomb">Régi jelszó</button>
              <button id="ujJelszoGomb">Új jelszó</button>    
              <Picture id="picturegrid"/>    
              </div>               
          </div>   
          
        </div>      
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import Picture from "../components/settings/setProfilePicture.vue";

export default {
  components: {
    Menu,
  },
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
</style>

<style scoped>
@import url("../assets/css/SettingsView.css");
</style>