<template>
    <div class="editor-container">
        <Home v-model="curPage" v-if="curPage === 0" />
        <Add v-model="curPage" v-if="curPage === 1" />
    </div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue"
import Home from './components/Home.vue'
import Add from './components/add.vue'

export default defineComponent({
    components: { Home, Add },
    setup() {
        const curPage = ref(0)
        return {
            curPage
        }
    }
})
</script>
<style lang="scss" scoped>
.editor-container {
    box-sizing: border-box;
    padding: 20px;
}
</style>