<template>
    <el-container class="layout-container-demo" style="height: 100vh">
        <el-aside width="200px" style="background-color :rgb(21 85 154);">
            <el-scrollbar>
                <el-menu :default-openeds="['1', '3']" style="min-height: 100%; overflow-x: hidden;"
                    background-color="rgb(21 85 154)" text-color="#fff" active-text-color="#ffd04b">
                    <div style="height: 60px;line-height: 60px;text-align: center;">
                        <b style="color: white;">鸿运当头</b>
                    </div>
                    <el-sub-menu index="1">
                        <template #title>
                            <el-icon>
                                <message />
                            </el-icon>股票预测
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="1-1">Option 1</el-menu-item>
                            <el-menu-item index="1-2">Option 2</el-menu-item>
                        </el-menu-item-group>
                    </el-sub-menu>
                    <el-sub-menu index="2">
                        <template #title>
                            <el-icon><icon-menu /></el-icon>分析
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="2-1">Option 1</el-menu-item>
                            <el-menu-item index="2-2">Option 2</el-menu-item>
                        </el-menu-item-group>
                    </el-sub-menu>
                    <el-sub-menu index="3">
                        <template #title>
                            <el-icon>
                                <setting />
                            </el-icon>推荐
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="3-1">Option 1</el-menu-item>
                            <el-menu-item index="3-2">Option 2</el-menu-item>
                            <el-menu-item index="3-3">Option 3</el-menu-item>
                            <el-menu-item index="3-4">Option 4</el-menu-item>
                        </el-menu-item-group>
                    </el-sub-menu>
                </el-menu>
            </el-scrollbar>
        </el-aside>

        <el-container>
            <el-header style="text-align: right; font-size: 16px;border-bottom: 1px solid #ccc ;">
                <div class="toolbar">
                    <el-dropdown>
                        <el-icon style="margin-right: 8px; margin-top: 1px">
                            <ArrowDownBold />
                        </el-icon>
                        <template #dropdown>
                            <el-dropdown-menu>
                                <el-dropdown-item>收藏</el-dropdown-item>
                                <el-dropdown-item>退出</el-dropdown-item>
                            </el-dropdown-menu>
                        </template>
                    </el-dropdown>
                    <span>Tom</span>
                </div>
            </el-header>
            <el-main>
                <el-calendar v-model="value" />
            </el-main>
        </el-container>
    </el-container>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import { Menu as IconMenu, Message, Setting } from '@element-plus/icons-vue'
const value = ref(new Date())
</script>

<style scoped>
.layout-container-demo .el-header {
    position: relative;
    background-color: var();
    color: var(--el-text-color-primary);
}

.layout-container-demo .el-aside {
    color: var(--el-text-color-primary);
    background: var(--el-color-primary-light-8);
}

.layout-container-demo .el-menu {
    border-right: none;
}

.layout-container-demo .el-main {
    padding: 0;
}

.layout-container-demo .toolbar {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    right: 20px;
}
</style>