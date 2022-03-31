<template>
  <div class="index">
    <Menu id="menu"></Menu>
    <div id="content">
      {{message}}
      <h1>Index</h1>
    </div>
  </div>
</template>

<script lang="ts">
import {onMounted, ref} from 'vue';
import Menu from "../components/LeftSideMenu.vue"
export default{
  name: "Index",
  setup(){
    const message = ref('Nem vagy bejelentkezve');
    onMounted(async () => {
      const response = await fetch("http://localhost:8881/api/user", {
              method: "GET",
              credentials: 'include',
          });

          const content = await response.json();

          message.value = `Hello ${content.name}`;
    });

    return{
      message
    }
  },
  components:{
        Menu
    }
}

</script>

<style scoped>
  .index{
    display: grid;
    grid-template-columns: 10% 90%;
    grid-template-rows: 100%;
    grid-template-areas: 
      "menu content"
    ;
  }

  #menu{
    grid-area: menu;
  }

  #content{
    grid-area: content;
  }
</style>
