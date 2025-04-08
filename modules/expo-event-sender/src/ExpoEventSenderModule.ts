import { NativeModule, requireNativeModule } from 'expo';

import { ExpoEventSenderModuleEvents } from './ExpoEventSender.types';

declare class ExpoEventSenderModule extends NativeModule<ExpoEventSenderModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<ExpoEventSenderModule>('ExpoEventSender');
