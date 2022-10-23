<template></template>
<script lang="ts">
import { useDialog } from 'naive-ui'
import { defineComponent } from 'vue'
export default defineComponent({
    name: 'DialogContent',
    setup() {
        //挂载在 window 方便与在js中使用
        window.$dialog = useDialog();
    },
})
</script>
