<template>
  <div class="table">
    <h1>{{title}}</h1>
    <table v-if="lastfiles != null">
      <div class="thead">
        <tr>
          <th>
            <input type="checkbox" name="" id="" />
          </th>
          <th>Típus</th>
          <th>Dokumentum neve</th>
          <th>Méret</th>
          <th>Legutóbbi módosítás</th>
          <th>Tagok</th>
          <th width="200px">#</th>
        </tr>
      </div>
      <TableRow class="tablerow" v-if="lastfiles != null && lastfiles.message == null" v-for="file in lastfiles"
        :key="file.name" :type="file.type" :title="file.name" :size="file.size" :lastedited="file.updated"
        :group="file.shared_group_id" :refresh="refresh" :id="file.id"></TableRow>
    </table>
    <div v-if="nofilemessage != null">
      {{ nofilemessage }}
    </div>
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
  props: {
    lastfilesobject: Object,
    refresh: Function,
    title: String
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
th {
  width: 20%;
  text-align: center;
}

table {
  border-collapse: separate;
  width: 80%;
  margin: auto;
  color: rgb(70, 84, 114);
}

.table {
  background-color: rgb(245, 246, 249);
  padding-left: 20px;
  padding-right: 20px;
  width: 90%;
  display: block;
  margin: auto;
}

.table>h1 {
  text-align: left;
  margin-bottom: 20px;
  color: rgb(132, 148, 165);
  padding-left: 10rem;
  padding-top: 1rem;
}

table th:nth-child(1),
table th:nth-child(2),
table th:nth-child(7) {
  width: 10%;
}

th:last-child {
  width: 200px;
}

.tablerow,
.thead {
  margin-left: 20px;
  margin-right: 20px;
}

.thead {
  color: rgb(179, 187, 198);
}
</style>