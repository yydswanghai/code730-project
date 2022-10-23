/**
 * 菜单
 */
import Menus from '../models/Menus'

export async function getMenus() {
    const result = await Menus.findAll();
    const json = JSON.parse(JSON.stringify(result)).map(it => {
        const newObj = {};
        Object.keys(it).forEach(key => {
            if(key !== 'deletedAt'){
                newObj[key] = it[key]
            }
        })
        return newObj;
    });
    return json;
}