// Reexport the native module. On web, it will be resolved to ExpoEventSenderModule.web.ts
// and on native platforms to ExpoEventSenderModule.ts
export { default } from './src/ExpoEventSenderModule';
export * from  './src/ExpoEventSender.types';
