// Reexport the native module. On web, it will be resolved to LinkButtonModule.web.ts
// and on native platforms to LinkButtonModule.ts
export { default } from './src/LinkButtonModule';
export { default as LinkButtonView } from './src/LinkButtonView';
export * from  './src/LinkButton.types';
