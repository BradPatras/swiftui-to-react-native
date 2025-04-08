import { NativeModule, requireNativeModule } from 'expo';

import { ExpoEventSenderModuleEvents } from './ExpoEventSender.types';

declare class ExpoEventSenderModule extends NativeModule<ExpoEventSenderModuleEvents> {
  PI: number;
  sendEvent(name: string, body: string): void;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<ExpoEventSenderModule>('ExpoEventSender');
