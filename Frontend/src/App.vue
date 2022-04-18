<template>
  <router-view></router-view>
</template>

<style>
*{
    padding:0;
    margin:0;
}
  body{
    background-color: #E9D8A6;
  }
  #keresesInput{
  width: 50%;
  height: 30px;
  border-color: none;
  border: none;
  outline: none;
  border-radius: 5px;
  margin: 5px;
  display: inline-block;
}

#keresesGomb{
  background-color: #009688;
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
  margin: 10px;
}

  /* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px #009688; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #009688; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #009688; 
}
</style>