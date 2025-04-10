import { requireNativeView } from 'expo';
import * as React from 'react';

import { LinkButtonViewProps } from './LinkButton.types';

const NativeView: React.ComponentType<LinkButtonViewProps> =
  requireNativeView('LinkButton');

export default function LinkButtonView(props: LinkButtonViewProps) {
  return <NativeView {...props} />;
}
