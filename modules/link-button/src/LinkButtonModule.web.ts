import { registerWebModule, NativeModule } from 'expo';

import { ChangeEventPayload } from './LinkButton.types';

type LinkButtonModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
}

class LinkButtonModule extends NativeModule<LinkButtonModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
};

export default registerWebModule(LinkButtonModule);
