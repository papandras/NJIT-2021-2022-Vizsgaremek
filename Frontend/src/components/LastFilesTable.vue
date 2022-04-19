<template>
  <table v-if="lastfiles != null">
    <div>
      <tr>
      <th>
        <input type="checkbox" name="" id="" />
      </th>
      <th>Típus</th>
      <th>Dokumentum neve</th>
      <th>Méret</th>
      <th>Legutóbbi módosítás</th>
      <th>Tagok</th>
      <th>#</th>
    </tr>
    </div>
    <TableRow class="tablerow" v-if="lastfiles != null && lastfiles.message == null" v-for="file in lastfiles" :key="file.name"
      :type="file.type" :title="file.name" :size="file.size" :lastedited="file.updated" :group="file.shared_group_id" :refresh="refresh"></TableRow>
  </table>
  <div v-if="nofilemessage != null">
    {{ nofilemessage }}
  </div>
</template>

<script>
import TableRow from "./LastFilesTableRow.vue";
import axios from "axios";
export default {
  components: {
    TableRow,
  },
  data() {
    return {
      lastfiles: null,
      nofilemessage: null
    }
  },
  props:{
    lastfilesobject: Object,
    refresh: Function
  },
  async mounted() {
    //this.getlastfiles();
  },
  watch: {
    lastfilesobject(newfiledata, oldfiledata) {
      if (newfiledata != null) {
        this.lastfiles = newfiledata.data;
        this.nofilemessage = newfiledata.message;
      }
    }
  },
};
</script>

<style>
  .tablerow:nth-child(2n){
    background-color: white;
  }

  th {
    width: 20%;
  }

  table {
    border-collapse: collapse;
  }
</style>