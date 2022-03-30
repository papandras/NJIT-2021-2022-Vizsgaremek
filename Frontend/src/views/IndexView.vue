<template>
  <div id="main">
    <ul id="pager">
      <li>
        <p>{{"Index page"}}</p>
        <button>x</button>
      </li>
      <button>+</button>
    </ul>
    <IndexPage></IndexPage>
  </div>
</template>

<script lang="ts">
import IndexPage from "../components/Index.vue";
export default {
  name: "Index",
  components: {
    IndexPage,
  },
};
</script>

<style scoped>
  #main{
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: 20% 80%;
    grid-template-areas: 
      "pager"
      "content"
    ;
  }

  #pager{
    grid-area: pager;
    user-select: none;
  }

  #pager>li{
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
  li>button, li>p{
    display: inline-block;
  }
  li>p{
    margin-right: 30px;
  }
  li>button{
    border: none;
    background-color: white;
  }
  li>button:hover{
    border: 1px solid black;
    border-radius: 50%;
  }
  
  IndexPage{
    grid-area: content;
  }
</style>