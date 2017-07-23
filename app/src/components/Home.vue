<template>
  <v-carousel>
    <v-carousel-item v-for="(item,i) in items" v-bind:src="item.src" :key="i"></v-carousel-item>
  </v-carousel>
</template>

<script>
  export default {
    data () {
      return {
        items: [
          {
            src: '/public/equipe-1.jpg'
          },
          {
            src: '/public/equipe-2.jpg'
          }
        ]
      }
    }
  }
</script>
