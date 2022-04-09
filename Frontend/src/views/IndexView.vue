<template>
  <div id="main">
    <ul id="pager">
      <PagerListItem v-for="tab in tabsCount" :key="tab" @click="changePage(tab)"></PagerListItem>
      <p @click="newTab" id="newTab">+</p>
    </ul>
    <div id="indexpage">
      <template v-for="tab in tabsCount" :key="tab">
        <IndexPage v-if="tab == displayedIndex" :vmi="tab"></IndexPage>
      </template>
    </div>
  </div>
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
  mounted(){
    const tabinfo = {
      "tabscount": 1,
      "tabinfo": {

      }
    }
  },
  setup() {
    let displayedIndex = ref(JSON.parse(localStorage.getItem("selectedtab")));
    let tabsCount = ref(JSON.parse(localStorage.getItem("tabscount")));
    const newTab = () => {
      if(tabsCount.value < 6){
        tabsCount.value += 1;
        displayedIndex.value += 1;
        localStorage.setItem("tabscount", JSON.stringify(displayedIndex.value));
      }else{
        alert("Maximum 6 ablakot lehet megnyitni!");
      }
    };

    const changePage = (id) => {
      displayedIndex.value = id;
      localStorage.setItem("selectedtab", JSON.stringify(displayedIndex.value));
    }

    return {
      newTab,
      tabsCount,
      changePage,
      displayedIndex,
    };
  },
};
</script>

<style scoped>
#main {
  display: grid;
  grid-template-rows: 0fr 20fr;
  grid-template-areas:
    "pager"
    "content";
}

#pager {
  grid-area: pager;
  user-select: none;
  line-height: 38px;
  display: none;
}

#indexpage {
  grid-area: content;
}

#newTab{
  background-color: #E9D8A6;
  border: none;
  font-size: 150%;
  height: 30px;
  padding-left: 5px;
  padding-right: 5px;
  display: inline;
}

#newTab:hover{
  border: 1px solid rgb(20, 14, 14);
  border-radius: 10px;
}
</style>