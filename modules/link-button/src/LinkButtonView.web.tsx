import * as React from 'react';

import { LinkButtonViewProps } from './LinkButton.types';

export default function LinkButtonView(props: LinkButtonViewProps) {
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
