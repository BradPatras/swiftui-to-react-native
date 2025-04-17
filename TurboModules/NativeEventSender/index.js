/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import NativeEventSender from './specs/NativeEventSender';

export default NativeEventSender;

AppRegistry.registerComponent(appName, () => App);
