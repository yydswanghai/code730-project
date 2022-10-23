<template>
    <NEmpty/>
</template>

<script lang="ts">
import { defineComponent, onBeforeMount } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { NEmpty } from 'naive-ui'
export default defineComponent({
    name: 'Redirect',
    components: {
        NEmpty,
    },
    setup(){
        const $route = useRoute()
        const $router = useRouter()
        onBeforeMount(() => {
            const { params, query } = $route
            const { path } = params
            $router.replace({
                path: '/' + path,
                query,
            })
        })
    },
})
</script>