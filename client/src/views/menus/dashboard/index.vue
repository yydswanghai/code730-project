<template>
    <div class="dashboard-container">
        <n-grid x-gap="12" :cols="4" style="padding-right: 12px;">
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>访问量</span>
                            <n-button type="primary" size="small" plain>日</n-button>
                        </div>
                    </template>
                    <div class="card-body">
                        <div class="top">
                            <span>35090</span>
                        </div>
                        <div class="flex">
                            <div class="text">
                                日同比 16%<n-icon color="#00ff6f">
                                    <CaretUpOutlined />
                                </n-icon>
                            </div>
                            <div class="text">
                                周同比 36%<n-icon color="#ffde66">
                                    <CaretDownOutlined />
                                </n-icon>
                            </div>
                        </div>
                    </div>
                    <template #footer>
                        <div class="flex">
                            <div class="text">总访问量：</div>
                            <div class="text">109,256,123</div>
                        </div>
                    </template>
                </n-card>
            </n-gi>
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>注册志愿者</span>
                            <n-button type="info" size="small" plain>人</n-button>
                        </div>
                    </template>
                    <div class="card-body">
                        <div class="top">
                            <span>15678</span>
                        </div>
                        <n-progress type="line" :percentage="60" :indicator-placement="'inside'" processing />
                    </div>
                    <template #footer>
                        <div class="flex">
                            <div class="text">总志愿者人数：</div>
                            <div class="text">14294582</div>
                        </div>
                    </template>
                </n-card>
            </n-gi>
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>新增服务时长</span>
                            <n-button type="success" size="small" plain>万小时</n-button>
                        </div>
                    </template>
                    <div class="card-body">
                        <div class="top">
                            <span>2989</span>
                        </div>
                        <div class="flex">
                            <div class="text">
                                日同比 30%<n-icon color="#00ff6f">
                                    <CaretUpOutlined />
                                </n-icon>
                            </div>
                            <div class="text">
                                周同比 2%<n-icon color="#ffde66">
                                    <CaretDownOutlined />
                                </n-icon>
                            </div>
                        </div>
                    </div>
                    <template #footer>
                        <div class="flex">
                            <div class="text">总志愿服务时长：</div>
                            <div class="text">61846</div>
                        </div>
                    </template>
                </n-card>
            </n-gi>
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>新增志愿服务组织</span>
                            <n-button type="warning" size="small" plain>个</n-button>
                        </div>
                    </template>
                    <div class="card-body">
                        <div class="top">
                            <span>56</span>
                        </div>
                        <div class="flex">
                            <div class="text">
                                日同比 15%<n-icon color="#00ff6f">
                                    <CaretUpOutlined />
                                </n-icon>
                            </div>
                            <div class="text">
                                周同比 5%<n-icon color="#ffde66">
                                    <CaretDownOutlined />
                                </n-icon>
                            </div>
                        </div>
                    </div>
                    <template #footer>
                        <div class="flex">
                            <div class="text">总组织数：</div>
                            <div class="text">61444</div>
                        </div>
                    </template>
                </n-card>
            </n-gi>
        </n-grid>
        <n-grid x-gap="24" :cols="8" style="margin: 20px 0 20px;">
            <n-gi v-for="item in list" :key="item.key">
                <n-card>
                    <div class="card-item" v-on="item.eventObject || {}">
                        <n-icon :color="item.color" :size="32">
                            <component :is="item.icon" />
                        </n-icon>
                        <span>{{ item.title }}</span>
                    </div>
                </n-card>
            </n-gi>
        </n-grid>
        <n-grid x-gap="12" :cols="2" style="margin: 20px 0 20px;">
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>新增志愿者地区趋势图</span>
                        </div>
                    </template>
                    <v-chart class="chart" :option="option2"></v-chart>
                </n-card>
            </n-gi>
            <n-gi>
                <n-card>
                    <template #header>
                        <div class="card-header">
                            <span>组织地区分布图</span>
                        </div>
                    </template>
                    <v-chart class="chart" :option="option"></v-chart>
                </n-card>
            </n-gi>
        </n-grid>
    </div>
</template>

<script lang="ts" setup>
import {
    CaretUpOutlined, CaretDownOutlined, UsergroupAddOutlined, BarChartOutlined,
    ShoppingCartOutlined, AccountBookOutlined, CreditCardOutlined,
    MailOutlined, TagsOutlined, SettingOutlined } from '@vicons/antd'
import { useMessage } from 'naive-ui'
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { PieChart, LineChart } from 'echarts/charts'
import { TitleComponent, TooltipComponent, LegendComponent,ToolboxComponent,
    GridComponent, SingleAxisComponent  } from 'echarts/components'
import VChart, { THEME_KEY } from 'vue-echarts'
import { ref, provide, computed } from 'vue'
import { useProjectSettingStore } from '@/store/modules/projectSetting'

use([CanvasRenderer, PieChart, TitleComponent, TooltipComponent, LegendComponent, ToolboxComponent,
    GridComponent, SingleAxisComponent, LineChart]);
const $message = useMessage();
const settingStore = useProjectSettingStore();
const theme = computed(() => {
    if(settingStore.themeSetting.isDark){
        return 'dark'
    }else{
        return 'light'
    }
});
provide(THEME_KEY, theme)

const list = [
    {
        key: 1001,
        icon: UsergroupAddOutlined,
        title: '用户',
        color: '#69c0ff',
        eventObject: {
            click: () => { $message.success('你点击了用户') }
        }
    },
    {
        key: 1002,
        icon: BarChartOutlined,
        title: '分析',
        color: '#69c0ff',
        eventObject: {
            click: () => { $message.info('你点击了分析') }
        }
    },
    {
        key: 1003,
        icon: ShoppingCartOutlined,
        title: '商品',
        color: '#ff9c6e',
        eventObject: {
            click: () => { $message.error('你点击了商品') }
        }
    },
    {
        key: 1004,
        icon: AccountBookOutlined,
        title: '订单',
        color: '#b37feb',
        eventObject: {
            click: () => { $message.warning('你点击了订单') }
        }
    },
    {
        key: 1005,
        icon: CreditCardOutlined,
        title: '票据',
        color: '#ffd666',
        eventObject: {
            click: () => { $message.info('你点击了票据') }
        }
    },
    {
        key: 1006,
        icon: MailOutlined,
        title: '消息',
        color: '#5cdbd3',
        eventObject: {
            click: () => { $message.success('你点击了消息') }
        }
    },
    {
        key: 1006,
        icon: TagsOutlined,
        title: '标签',
        color: '#ff85c0',
        eventObject: {
            click: () => { $message.warning('你点击了标签') }
        }
    },
    {
        key: 1007,
        icon: SettingOutlined,
        title: '配置',
        color: '#ffc069',
        eventObject: {
            click: () => { $message.error('你点击了配置') }
        }
    },
]
const option = ref({
    title: {
        text: 'organization distribution',
        left: 'center',
    },
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)',
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['东莞', '佛山', '珠海', '中山', '广州'],
    },
    series: [
        {
            name: 'Traffic Sources',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
                { value: 335, name: '东莞' },
                { value: 310, name: '佛山' },
                { value: 234, name: '珠海' },
                { value: 135, name: '中山' },
                { value: 1548, name: '广州' },
            ],
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                },
            },
        },
    ],
});
const option2 = ref({
    title: {
        text: '地区'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['佛山', '东莞', '珠海', '中山', '广州']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: '佛山',
            type: 'line',
            stack: 'Total',
            data: [120, 132, 101, 134, 90, 230, 210]
        },
        {
            name: '东莞',
            type: 'line',
            stack: 'Total',
            data: [220, 182, 191, 234, 290, 330, 310]
        },
        {
            name: '珠海',
            type: 'line',
            stack: 'Total',
            data: [150, 232, 201, 154, 190, 330, 410]
        },
        {
            name: '中山',
            type: 'line',
            stack: 'Total',
            data: [320, 332, 301, 334, 390, 330, 320]
        },
        {
            name: '广州',
            type: 'line',
            stack: 'Total',
            data: [820, 932, 901, 934, 1290, 1330, 1320]
        }
    ]
})
</script>
<style lang="scss" scoped>
.dashboard-container {
    .card-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        span {
            font-weight: bold;
            font-size: 18px;
        }
    }
    .card-body {
        box-sizing: border-box;
        height: 80px;
        .top {
            padding: 6px 0;

            span {
                font-size: 1.875rem;
                line-height: 2.25rem;
            }
        }
    }
    .flex {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .card-item {
        padding: 12px 16px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        span {
            margin-top: 5px;
        }
    }
    .chart {
        height: 360px;
    }
}
</style>