import { createProdMockServer } from 'vite-plugin-mock/es/createProdMockServer';

const modules: Record<string, any> = import.meta.glob('../mock/*.ts', { eager: true });
const mockModules: any[] = [];
Object.keys(modules).forEach((key) => {
    mockModules.push(...modules[key].default);
})
console.log(mockModules)

export function setupProdMockServer() {
    createProdMockServer(mockModules);
}