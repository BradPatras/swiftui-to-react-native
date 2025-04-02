import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
    sendEvent(name: string, json: string): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>(
    'NativeEventSender',
);
