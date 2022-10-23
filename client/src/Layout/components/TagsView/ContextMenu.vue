<template>
    <div class="tabs-close">
        <n-dropdown
            trigger="hover"
            placement="bottom-end"
            :options="contextMenuOptions"
            @select="selectContextMenu"
            >
            <div class="tabs-close-btn">
                <n-icon size="16" color="#515a6e">
                    <DownOutlined />
                </n-icon>
            </div>
        </n-dropdown>
    </div>
    <n-dropdown
        :show="showDropdown"
        :x="left"
        :y="top"
        @clickoutside="$emit('update:showDropdown', false)"
        placement="bottom-start"
        :options="contextMenuOptions"
        @select="selectContextMenu"
    />
</template>

<script lang="ts">
import { defineComponent, ref, inject, computed, PropType } from "vue"
import { useRoute, useRouter } from 'vue-router'
import { useMessage, DropdownOption } from 'naive-ui'
import { useTagsViewStore, IRouteItem } from '@/store/modules/tagsView'
import { DownOutlined, CloseOutlined, ReloadOutlined, ColumnWidthOutlined, MinusOutlined } from '@vicons/antd'
import { renderIcon } from '@/utils/'
import { PageEnum } from '@/enums/pageEnum'

export default defineComponent({
    name: 'ContextMenu',
    props: {
        top: Number,
        left: Number,
        activeKey: String,
        showDropdown: Boolean,
        isCurrent: Boolean,
        tagsList: {
            type: Array as PropType<IRouteItem[]>,
            required: true
        }
    },
    emits: ['updateNav', 'update:showDropdown', 'update:activeKey'],
    components: {
        DownOutlined,
        CloseOutlined,
        ReloadOutlined,
        ColumnWidthOutlined,
        MinusOutlined
    },
    setup(props, ctx){
        const $route = useRoute();
        const $router = useRouter();
        const tagsViewStore = useTagsViewStore();
        const $message = useMessage();
        enum contextMenuEnum {
            刷新当前,
            关闭当前,
            关闭其他,
            关闭全部
        }
        /* 下拉菜单 */
        const contextMenuOptions = computed(() => {
            const isDisabled = props.tagsList.length <= 1;
            const isHome = props.activeKey === PageEnum.HOME;// 当前选中到控制台不能关闭全部
            return [
                {
                    label: '刷新当前',
                    key: contextMenuEnum.刷新当前,
                    disabled: false,
                    icon: renderIcon(ReloadOutlined),
                },
                {
                    label: '关闭当前',
                    key: contextMenuEnum.关闭当前,
                    disabled: isHome || props.isCurrent || isDisabled,
                    icon: renderIcon(CloseOutlined),
                },
                {
                    label: '关闭其他',
                    key: contextMenuEnum.关闭其他,
                    disabled: isDisabled,
                    icon: renderIcon(ColumnWidthOutlined),
                },
                {
                    label: '关闭全部',
                    key: contextMenuEnum.关闭全部,
                    disabled: isHome || isDisabled,
                    icon: renderIcon(MinusOutlined),
                },
            ]
        });
        /* 刷新 */
        const reload = inject<() => void>('reload');
        /* 关闭当前页面 */
        function removeTab(route: IRouteItem) {
            if (props.tagsList.length === 1) {
                return $message.warning('这已经是最后一页，不能再关闭了！');
            }
            tagsViewStore.closeCurrentTag(route);
            // 如果关闭是的当前页，则当前页自动变成上一个
            if (props.activeKey === route.fullPath) {
                const currentRoute = props.tagsList[Math.max(0, props.tagsList.length - 1)]
                ctx.emit('update:activeKey', currentRoute.fullPath);
                $router.push(currentRoute);
            }
        }
        /* 关闭其他 */
        function closeOther(route: IRouteItem) {
            tagsViewStore.closeOtherTags(route);
            ctx.emit('update:activeKey', route.fullPath);
            $router.replace(route.fullPath)
        }
        /* 关闭全部 */
        function closeAll() {
            tagsViewStore.closeAllTags();
            $router.replace(PageEnum.HOME);
        }
        /* 操作右键菜单 */
        function selectContextMenu(key: number, option: DropdownOption) {
            if(option.disabled){
                return;
            }
            if(key === contextMenuEnum.刷新当前){
                reload && reload();
            }else if(key === contextMenuEnum.关闭当前){
                removeTab($route as IRouteItem);
            }else if(key === contextMenuEnum.关闭其他){
                closeOther($route as IRouteItem);
            }else if(key === contextMenuEnum.关闭全部){
                closeAll();
            }
            ctx.emit('updateNav');
            ctx.emit('update:showDropdown', false);
        }
        return {
            contextMenuOptions,
            removeTab,
            selectContextMenu,
        }
    }
})
</script>
<style lang="scss" scoped>
.tabs-close {
    min-width: 32px;
    width: 32px;
    height: 32px;
    line-height: 32px;
    text-align: center;
    background: var(--color);
    border-radius: 2px;
    cursor: pointer;
    .tabs-close-btn {
        color: var(--color);
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
}
</style>