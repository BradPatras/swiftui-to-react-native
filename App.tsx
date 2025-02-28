import React from "react";
import {
  Image,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  View,
} from "react-native";
import {
  Colors,
  DebugInstructions,
  Header,
  ReloadInstructions,
} from "react-native/Libraries/NewAppScreen";
import FontAwesome6 from '@react-native-vector-icons/fontawesome6';

type AppProps = {
  id: number;
  imageUrl?: string;
  emoji?: string;
  established?: string;
  name?: string;
  location?: string;
  description?: string;
};

function App(props: AppProps): React.JSX.Element {
  const isDarkMode = useColorScheme() === "dark";

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

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
          <Text style={{fontSize: 12, fontWeight: "400", flex: 1}}>est {props.established}</Text>
          <Text style={{fontSize: 12, fontWeight: "400", marginRight: 8}}>{props.location}</Text>
          <FontAwesome6 name="location-arrow" iconStyle="solid"/>
        </View>
        <Text style={{ padding: 10, marginTop: 20, fontSize: 16}}>{props.description}</Text>
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
