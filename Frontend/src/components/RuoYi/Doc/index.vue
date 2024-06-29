<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script setup>

function goto() {
  window.open(url.value)
}
</script>