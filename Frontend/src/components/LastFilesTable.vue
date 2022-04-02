<template>
  <table>
    <tr>
      <th>
        <input type="checkbox" name="" id="" />
      </th>
      <th>Típus</th>
      <th>Dokumentum neve</th>
      <th>Méret</th>
      <th>Legutóbbi módosítás</th>
      <th>Tagok</th>
      <th></th>
    </tr>
    <TableRow type="doc" title="Cim" size="3 mb" lastedited="2023"></TableRow>
    <TableRow type="jpeg" title="Pelda" size="5 mb" lastedited="2023"></TableRow>
    <TableRow type="txt" title="Új szöveges dokumentum" size="23 kb" lastedited="2023"></TableRow>
  </table>
</template>

<script>
import TableRow from "./LastFilesTableRow.vue";
export default {
  components: {
    TableRow,
  },
  setup() {

  },
};
</script>