<template>
    <div class="error-page-container">
        <div class="text-center">
            <img src="~@/assets/404.svg?url" alt="" />
        </div>
        <div class="text-center">
            <h1 class="text-base text-gray-500">抱歉，你访问的页面不存在</h1>
            <NButton type="info" @click="goHome">回到首页</NButton>
        </div>
    </div>
</template>

<script lang="ts">
import { defineComponent } from "vue"
import { useRouter } from 'vue-router'
export default defineComponent({
    setup(){
        const $router = useRouter()
        function goHome() {
            $router.push('/');
        }
        return {
            goHome
        }
    }
})
</script>

<style lang="scss" scoped>
.error-page-container {
    width: 100%;
    border-radius: 4px;
    padding: 50px 0;
    height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    .text-center {
        text-align: center;
        h1 {
            color: #666;
            padding: 20px 0;
        }
    }
    img {
        width: 350px;
        margin: 0 auto;
    }
}
</style>