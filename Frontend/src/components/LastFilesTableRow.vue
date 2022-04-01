<template>
  <tr>
    <td>
      <input type="checkbox" :name="data.checkboxname" />
    </td>
    <td>
      <img src="#" alt="type icon" />
    </td>
    <td>{{data.title}}</td>
    <td>0.5 MB</td>
    <td>
      <img src="@/assets/doticon.svg" alt="menu" />
    </td>
  </tr>
</template>

<script>
import { reactive } from "vue";
export default {
    setup(){
        const data = reactive({
            checkboxname: "",
            title: "Cím",
            size: ""
        })

        return{
            data
        }
    }
}
</script>