<template>
  <div>
    <input
      type="password"
      name="password"
      id="password"
      placeholder="Régi jelszó"
      class="input"
    />
    <input
      type="password"
      name="confirm"
      id="confirm"
      placeholder="Új jelszó"
      class="input"
    />
    <input type="button" value="Fiók törlése" class="button" />
  </div>
</template>

<style scoped>
div {
  height: 200px;
  padding-top: 10px;
}

div > * {
    display: block;
}

.button {
  background-color: #DC143C;
}
</style>