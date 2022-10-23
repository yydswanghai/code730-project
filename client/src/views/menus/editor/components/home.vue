<template>
    <div class="home-container">
        <n-button type="primary" @click="$emit('update:modelValue', modelValue+1)">添加</n-button>
        <h2>书籍列表</h2>
        <n-data-table :columns="columns" :data="list" />
        <n-pagination
            style="margin-top: 10px;"
            v-model:page="page"
            v-model:page-size="pageSize"
            :page-count="count"
            show-size-picker
            :page-sizes="pageSizes"
            @update-page="updatePage"
            @update-page-size="updatePageSize"
        />
    </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from "vue"
import { getBooks } from '@/api/editor'
import { statusCodeEnum } from '@/enums/statusCodeEnum'

export default defineComponent({
    emits: ['update:modelValue'],
    props: {
        modelValue: {
            type: Number,
            default: 0,
        },
    },
    setup() {
        const columns = [
            { title: '书籍名称', key: 'name', width: 160 },
            { title: '作者', key: 'author', width: 160 },
            { title: '发布时间', key: 'publishDate', width: 100 },
            { title: '封面图', key: 'imgurl', width: 300 },
            { title: '书籍描述', key: 'description', ellipsis: { tooltip: true } },
        ]

        const state = reactive({
            list: [],
            page: 1,
            pageSize: 10,
            count: 100,
            pageSizes: [10, 20, 30, 40, 50]
        })

        async function fetchDatas() {
            const resp = await getBooks({ page: state.page, pageSize: state.pageSize })
            if(resp.code === statusCodeEnum.success){
                state.list = resp.data.datas.map((item: any) => ({
                    key: item.id,
                    name: item.name,
                    author: item.author,
                    publishDate: item.publishDate,
                    imgurl: item.imgurl,
                    description: item.description
                }))
                state.count = Math.ceil(resp.data.total / state.pageSize);
            }
        }
        fetchDatas()

        function updatePage(page: number) {
            fetchDatas()
        }
        function updatePageSize(pageSize: number) {
            fetchDatas()
        }
        return {
            ...toRefs(state),
            columns,
            updatePage,
            updatePageSize,
        }
    }
})
</script>
<style lang="scss">
.v-binder-follower-container{
    .n-popover__content{
        max-width: 600px;
    }
}
</style>