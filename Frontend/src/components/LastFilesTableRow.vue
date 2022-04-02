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
    <td></td>
    <td>
      <img src="@/assets/doticon.svg" alt="menu" />
    </td>
  </tr>
</template>

<script>
import { toRefs, reactive } from "vue";
export default {
  props:{
    checkboxname: String,
    type: String, 
    title: String,
    size: String,
    lastedited: String
  },
    setup(props){
        const { checkboxname, type, title, size, lastedited } = toRefs(props)
    }
}
</script>