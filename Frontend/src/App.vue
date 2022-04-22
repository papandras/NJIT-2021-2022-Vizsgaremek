<template>
  <router-view></router-view>
</template>

<style>
*{
    padding:0;
    margin:0;
    user-select: none;
}
  body{
    background-color: #E9D8A6;
  }
  #keresesInput, .input{
  width: 50%;
  height: 30px;
  border-color: none;
  border: none;
  outline: none;
  border-radius: 5px;
  margin: 5px;
  display: inline-block;
}

#keresesGomb, .button{
  background-color: #009688;
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
  margin: 10px;
}

.button:active {
  animation: shadow .15s ease-in-out;
}

@keyframes shadow {
  0% {
    box-shadow: inset 5px 5px 10px black, inset 5px -5px 10px white;
  }

  100% {
    box-shadow: none;
  }
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

.sectionheader {
  background-color: #009688;
  color: rgb(245, 246, 249);
  padding-top: 10px;
  padding-bottom: 10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.sectioncontent {
  padding: 20px;
  padding-left: 50px;
  padding-right: 50px;
}
</style>