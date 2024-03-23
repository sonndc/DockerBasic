<script setup lang="ts">
const { data: notices } = await useFetch('http://????:????/api/notice/show')
</script>

<template>
  <div v-for="notice in notices">
    {{ notice.name }}
  </div>
</template>
