<template>
    <NLoadingBarProvider>
        <NDialogProvider>
            <DialogContent />
            <NNotificationProvider>
                <NMessageProvider>
                    <MessageContent />
                    <slot slot="default"></slot>
                </NMessageProvider>
            </NNotificationProvider>
        </NDialogProvider>
    </NLoadingBarProvider>
</template>

<script lang="ts">
/**
 * 这个组件主要用来做全局挂载
 */
import MessageContent from '@/components/MessageContent/index.vue'
import DialogContent from '@/components/DialogContent/index.vue'
import { defineComponent } from 'vue'
export default defineComponent({
    name: 'Application',
    components: {
        MessageContent,
        DialogContent,
    },
})
</script>
