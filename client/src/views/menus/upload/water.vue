<template>
    <div class="water-container">
        <MultipleWater />
    </div>
</template>

<script lang="ts">
import { defineComponent } from "vue"
import MultipleWater from './components/multiple-water.vue'
export default defineComponent({
    components: {
        MultipleWater,
    }
})
</script>
<style lang="scss" scoped>
.water-container{
    width: 100%;
    height: calc(100vh - 108px);
    background: #eee;
    padding: 20px;
    box-sizing: border-box;
}
</style>