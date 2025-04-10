import { NativeModule, requireNativeModule } from 'expo';

import { LinkButtonModuleEvents } from './LinkButton.types';

declare class LinkButtonModule extends NativeModule<LinkButtonModuleEvents> {}

// This call loads the native module object from the JSI.
export default requireNativeModule<LinkButtonModule>('LinkButton');
