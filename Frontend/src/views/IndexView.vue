<template>
  <div id="main">
    <ul id="pager">
      <PagerListItem v-for="tab in tabsCount" :key="db"></PagerListItem>
      <p @click="newTab" id="newTab">+</p>
    </ul>
    <div id="indexpage">
      <IndexPage></IndexPage>
    </div>
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
  grid-template-rows: 1fr 19fr;
  grid-template-areas:
    "pager"
    "content";
}

#pager {
  grid-area: pager;
  user-select: none;
  line-height: 38px;
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