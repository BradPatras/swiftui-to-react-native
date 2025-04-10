import type { StyleProp, ViewStyle } from 'react-native';

export type OnLoadEventPayload = {
  url: string;
  title: string;
};

export type LinkButtonModuleEvents = {};

export type LinkButtonViewProps = {
  url: string;
  title: string;
  style?: StyleProp<ViewStyle>;
};
