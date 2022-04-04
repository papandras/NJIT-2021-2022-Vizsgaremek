<template>
  <div id="statelement">
    <img :src="icon" alt="Type" />
    <span id="type" v-text="typeName"></span>
    <span id="size" v-text="size + ' GB'"></span>
    <ProgressBar :filled="progress" :color="color" maxsize="100" width="300" class="progress"></ProgressBar>
  </div>
</template>

<script>
import { toRefs } from "vue";
import ProgressBar from "./ProgressBar.vue";
export default {
  data() {
    return {
      icon: null,
      typeName: null,
      size: null,
      progress: null,
    };
  },
  props: {
    icon: String,
    typeName: String,
    size: Number,
    progress: Number,
    color: String,
  },
  setup(props) {
    const { icon, typeName, size, progress } = toRefs(props);
  },
  components: {
      ProgressBar,
  }
};
</script>

<style scoped>
#statelement {
  width: 300px;
  display: grid;
  grid-template-rows: 1fr 1fr;
  grid-template-columns: 1fr 4fr 1fr;
  grid-template-areas:
    "img type size"
    "progress progress progress";
}

#type {
  grid-area: type;
}

#size {
  grid-area: size;
}

.progress {
  display: block;
  width: 300px;
  grid-area: progress;
}
</style>