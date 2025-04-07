import type {HostComponent, ViewProps} from 'react-native';
import type {BubblingEventHandler} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface NativeProps extends ViewProps {
    isFavorite: boolean;
    onFavoriteTapped?: BubblingEventHandler<{ isFavorite: boolean }> | null;
}

export default codegenNativeComponent<NativeProps>(
    'FavoriteButton',
) as HostComponent<NativeProps>;