<template>
  <div class="hero">
    <navigation-component></navigation-component>
    <div class="spacer_header"></div>
    <router-view />
    <sidemenu-component></sidemenu-component>
  </div>
</template>

<script>
export default {
  name: 'main-layout',
  components: {
    NavigationComponent: () => import('@/components/navigation'),
    SidemenuComponent: () => import('@/components/sidemenu')
  }
}
</script>

<style>
</style>