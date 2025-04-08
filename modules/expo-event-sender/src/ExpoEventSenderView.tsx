import { requireNativeView } from 'expo';
import * as React from 'react';

import { ExpoEventSenderViewProps } from './ExpoEventSender.types';

const NativeView: React.ComponentType<ExpoEventSenderViewProps> =
  requireNativeView('ExpoEventSender');

export default function ExpoEventSenderView(props: ExpoEventSenderViewProps) {
  return <NativeView {...props} />;
}
