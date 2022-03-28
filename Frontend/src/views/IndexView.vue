<template>
  <div class="index">
    {{message}}
    <h1>Index</h1>
  </div>
</template>

<script lang="ts">
import {onMounted, ref} from 'vue';
export default{
  name: "Index",
  setup(){
    const message = ref('Nem vagy bejelentkezve');
    onMounted(async () => {
      const response = await fetch("http://localhost:8881/api/user", {
              method: "GET",
              credentials: 'include',
          });

          const content = await response.json();

          message.value = `Hello ${content.name}`;
    });

    return{
      message
    }
  }
}

</script>