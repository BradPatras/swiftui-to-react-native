import * as React from 'react';

import { ExpoEventSenderViewProps } from './ExpoEventSender.types';

export default function ExpoEventSenderView(props: ExpoEventSenderViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        src={props.url}
        onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
