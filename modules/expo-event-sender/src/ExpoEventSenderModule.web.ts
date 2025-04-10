import { registerWebModule, NativeModule } from 'expo';

import { ChangeEventPayload } from './ExpoEventSender.types';

type ExpoEventSenderModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
}

class ExpoEventSenderModule extends NativeModule<ExpoEventSenderModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
};

export default registerWebModule(ExpoEventSenderModule);
