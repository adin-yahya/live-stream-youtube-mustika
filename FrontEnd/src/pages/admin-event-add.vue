<template>
  <div class="container">
    <div class="hero_wrap">
      <event-form></event-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'event-add',
  components: {
    eventForm: () => import('@/pages/admin-event-form')
  }
}
</script>

<style>
</style>