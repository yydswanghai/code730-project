import Cookies from 'js-cookie'

export function getCookie(key: string){
    return Cookies.get(key)
}

export function setCookie(key: string, value: any){
    return Cookies.set(key, value)
}

export function delCookie(key: string){
    return Cookies.remove(key)
}