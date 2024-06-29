<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script setup>

function goto() {
  window.open(url.value)
}
</script>
