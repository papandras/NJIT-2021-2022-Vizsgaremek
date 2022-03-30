<template>
  <div id="main">
    <ul id="pager">
      <PagerListItem v-for="tab in tabsCount" :key="db"></PagerListItem>
      <button @click="newTab" id="newTab">+</button>
    </ul>
    <IndexPage></IndexPage>
  </div>
  <vue-basic-alert 
       :duration="300"
       :closeIn="300"
       ref="alert" />
</template>

<script lang="ts">
import {ref} from 'vue';
import IndexPage from "../components/Index.vue";
import PagerListItem from "../components/PagerListItem.vue";
export default {
  name: "Index",
  components: {
    IndexPage,
    PagerListItem,
  },
  setup() {
    let tabsCount = ref(1);
    const newTab = () => {
      if(tabsCount.value < 6){
        tabsCount.value += 1;
      }else{
        alert("Maximum 6 ablakot lehet megnyitni!");
      }
    };

    const clickedpage = (par) => {
      alert(par);
    }

    return {
      newTab,
      clickedpage,
      tabsCount,
    };
  },
};
</script>

<style scoped>
#main {
  display: grid;
  grid-template-columns: 100%;
  grid-template-rows: 20% 80%;
  grid-template-areas:
    "pager"
    "content";
}

#pager {
  grid-area: pager;
  user-select: none;
  border: 1px solid black;
  line-height: fit-content;
}

#pager > li {
  display: inline-block;
  border: 2px solid black;
  margin-right: 2px;
  border-top-left-radius: 20px;
  border-bottom-right-radius: 20px;
  border-top-right-radius: 5px;
  border-bottom-left-radius: 5px;
  width: 140px;
  text-align: center;
  line-height: 1%;
}

IndexPage {
  grid-area: content;
}

#newTab{
  background-color: #E9D8A6;
  border: none;
  font-size: 150%;
  width: 30px;
  height: 30px;
}

#newTab:hover{
  border: 1px solid rgb(20, 14, 14);
  border-radius: 10px;
}
</style>