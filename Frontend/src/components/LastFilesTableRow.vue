<template>
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
      <img src="@/assets/doticon.svg" alt="menu" />
    </td>
  </tr>
</template>

<script>
import { toRefs } from "vue";
export default {
  props:{
    checkboxname: String,
    type: String, 
    title: String,
    size: String,
    lastedited: String,
    group: Number
  },
    setup(props){
        const { checkboxname, type, title, size, lastedited, group } = toRefs(props)
    }
}
</script>