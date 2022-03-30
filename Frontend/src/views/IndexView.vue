<template>
  <div id="main">
    <ul id="pager">
      <PagerListItem @click="clickedpage(hello)" v-for="tab in tabsCount" :key="db"></PagerListItem>
      <button @click="newTab">+</button>
    </ul>
    <IndexPage></IndexPage>
  </div>
</template>

<script lang="ts">
import IndexPage from "../components/Index.vue";
import PagerListItem from "../components/PagerListItem.vue";
export default {
  name: "Index",
  components: {
    IndexPage,
    PagerListItem,
  },
  setup() {
    const hello = "helloooo";
    let tabsCount = 1;
    const newTab = () => {
      tabsCount += 1;
      console.log(tabsCount);
    };

    const clickedpage = (par) => {
      alert(par);
    }

    return {
      newTab,
      clickedpage,
      tabsCount,
      hello
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
</style>