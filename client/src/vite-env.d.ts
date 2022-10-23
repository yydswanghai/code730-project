/// <reference types="vite/client" />

/// <reference types="vite-svg-loader" />

declare module '*.vue' {
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<{}, {}, any>
  export default component
}

declare type Recordable<T = any> = Record<string, T>

declare interface Window {
  $message: any
  $dialog: any
}

declare module 'node_modules/cropperjs/dist/cropper.js' {
  import cropper from 'cropperjs';
  export default cropper;
}