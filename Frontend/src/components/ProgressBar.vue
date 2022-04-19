<template>
  <div id="progressbar" :style="{ width: width + 'px' }">
    <div id="filled" :style="{ width: (width / 100) * filled + 'px', 'background-color': color }"></div>
    <div id="unfilled" :style="{ width: width - (width / 100) * filled + 'px' }"></div>
  </div>
</template>

<style scoped>
#progressbar {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas: "filled unfilled";
  height: 7px;
  border: 1px solid #b2b2b2;
  border-radius: 5px;
}
#filled {
  grid-area: filled;
  background-color: #007dfc;
  height: 7px;
  display: inline-block;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}
#unfilled {
  grid-area: unfilled;
  background-color: white;
  display: inline-block;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
</style>

<script>
export default {
  props: {
    maxsize: String,
    filled: String,
    width: String,
    color: String,
  },
  mounted() {},
};
</script>