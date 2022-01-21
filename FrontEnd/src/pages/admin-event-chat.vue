<template>
  <div class="row">
    <div v-for="(d,i) in divisionList" :key="i+'-chat'" class="col-12 col-md-6 my-3">
      <div class="chat-wrapper" style="height:620px">
        <h6 class="tab mx-2 pb-2 pointer">{{ d.division_name }}</h6>
        <div class="chat-body h-100">
          <live-comment :event="{ 'id': Number(id) }" :room="d.id" :send="false"></live-comment>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'chat-history',
  props: {
    id: { required: false },
  },
  components: {
    LiveComment: () => import('../components/comment'),
  },
  data () {
    return {
      divisionList: []
    }
  },
  mounted () {
    let injectDivision = [
      { division_name: 'Live Chat', id: -1 }
    ]
    this.getSubData('division', 'divisionList', injectDivision)
  },
  methods: {
    getSubData (e, data, inject = []) {
      this.$_sys.get(e, this.filter).then(res => {
        this[data] = inject.concat(res.data)
      })
    },
  }
}
</script>

<style scoped>
  .chat-wrapper {
    box-shadow: 52px 52px 74px 0 rgb(115 131 169 / 8%);
  }
</style>