<template>
  <div>
    <tr>
      <td>
        <input type="checkbox" :name="checkboxname" />
      </td>
      <td>
        <img src="#" :alt="type" />
      </td>
      <td>{{ title }}</td>
      <td>{{ size }}</td>
      <td>{{ lastedited }}</td>
      <td>{{ group ?? "Nincs megosztva senkivel" }}</td>
      <td>
        <img src="@/assets/doticon.svg" alt="menu" @click="showmenu" />
      </td>
    </tr>
    <tr class="menurow" v-if="minimenu">
      <td colspan="2">Letöltés <img src="src/assets/download_icon.svg" alt="Letöltés"
          id="downloadicon"><br></td>
      <td colspan="2">
        <p>Megosztás</p>
        <img src="src/assets/share_icon.svg" alt="Megosztás" id="shareicon">
        <select name="" id="">
          <option value="">Válassz csoportot</option>
        </select>
      </td>
      <td colspan="2">Törlés <img src="src/assets/delete_icon.svg" alt="Törlés" id="deleteicon"><br></td>
    </tr>
  </div>
</template>

<script>
import { toRefs } from "vue";
export default {
  props: {
    checkboxname: String,
    type: String,
    title: String,
    size: String,
    lastedited: String,
    group: Number
  },
  data() {
    return {
      minimenu: true
    }
  },
  setup(props) {
    const { checkboxname, type, title, size, lastedited, group } = toRefs(props)
  },
  methods: {
    showmenu() {
      this.minimenu = !this.minimenu;
      switch (this.minimenu) {
        case true:
          document.getElementById("minimenu").style.display = "block";
        default:
          document.getElementById("minimenu").style.display = "none";
      }
    }
  },
}
</script>

<style scoped>
#minimenu {
  display: none;
}

#downloadicon,
#shareicon,
#deleteicon {
  height: 20px;
  display: block;
  margin: auto;
  margin-top: 5px;
  margin-bottom: 5px;
}

tr:nth-child(2n+1)>td {
  padding-top: 10px;
  text-align: center;
  width: 20%;
}

tr:nth-child(2n)>td {
  text-align: center;
  border-top: 2px solid black;
}

tr:nth-child(2n) {
  padding-bottom: 10px;
}
</style>