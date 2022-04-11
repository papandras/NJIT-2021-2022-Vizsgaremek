<template>
  <div class="settings">
    <Menu id="menu" activepage="index"></Menu>
    <div id="content">
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";

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