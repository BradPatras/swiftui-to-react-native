import React, { useState } from "react";
import {
  Image,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  View,
  Button,
} from "react-native";
import {
  Colors,
} from "react-native/Libraries/NewAppScreen";
import FontAwesome6 from '@react-native-vector-icons/fontawesome6';
import FavoriteButton from './specs/FavoriteButtonNativeComponent';
import NativeEventSender from 'native-event-sender';
import LinkButton from './modules/link-button/src/LinkButtonView';
import ExpoEventSender from "./modules/expo-event-sender";
type AppProps = {
  id: number;
  imageUrl?: string;
  emoji?: string;
  established?: string;
  name?: string;
  location?: string;
  description?: string;
  isFavorite?: boolean;
};

function App(props: AppProps): React.JSX.Element {
  const isDarkMode = useColorScheme() === "dark";
  const [isFavorite, setIsFavorite] = useState(props.isFavorite || false);

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  function toggleIsFavorite(isFavorite: boolean) {
    setIsFavorite(isFavorite);
    // Notify the native side about the change using expo module
    // ExpoEventSender.sendEvent(
    //   "parkFavoriteChanged",
    //   JSON.stringify({ parkId: props.id, isFavorite: isFavorite })
    // );

    // Notify the native side about the change using turbo module
    NativeEventSender.sendEvent(
      "parkFavoriteChanged",
      JSON.stringify({ parkId: props.id, isFavorite: isFavorite })
    );
  }

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? "light-content" : "dark-content"}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <ScrollView
        style={{
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
        }}
      >
        <Image
          style={{ height: 300, width: "100%", padding: 0 }}
          source={{
            uri: props.imageUrl,
          }}
        />
        <View
          style={{
            flexDirection: "row",
            justifyContent: "space-between",
            padding: 10,
          }}
        >
          <Text style={{ fontSize: 12, fontWeight: "400", flex: 1 }}>
            est. {props.established}
          </Text>
          <Text style={{ fontSize: 12, fontWeight: "400", marginRight: 8 }}>
            {props.location}
          </Text>
          <FontAwesome6 name="location-arrow" iconStyle="solid" />
        </View>
        <Text style={{ padding: 10, marginTop: 20, fontSize: 16 }}>
          {props.description}
        </Text>

        <View
          style={{
            flexDirection: "row",
            justifyContent: "space-around",
            alignItems: "center",
            padding: 10,
          }}>
          <FavoriteButton
            style={{ height: 40, width: 200 }}
            isFavorite={isFavorite}
            onFavoriteTapped={(event) => {
              const newFavoriteStatus = !event.nativeEvent.isFavorite;
              toggleIsFavorite(newFavoriteStatus);
            }}
          />
        </View>
        <View
          style={{
            flexDirection: "row",
            justifyContent: "center",
            alignItems: "center",
            padding: 10,
          }}>
          <LinkButton
            style={{ height: 40, flex: 1 }}
            url="https://www.nps.gov/yose/index.htm"
            title="View current conditions"
          />
        </View>

      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  title: {
    fontSize: 24,
    fontWeight: "600",
  },
  subtitle: {
    fontSize: 12,
    fontWeight: "400",
  },
  bold: {
    fontWeight: "700",
  },
});

export default App;
