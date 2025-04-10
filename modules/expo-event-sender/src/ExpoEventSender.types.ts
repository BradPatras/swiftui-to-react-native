
export type OnLoadEventPayload = {
  url: string;
};

export type ExpoEventSenderModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
};

export type ChangeEventPayload = {
  value: string;
};