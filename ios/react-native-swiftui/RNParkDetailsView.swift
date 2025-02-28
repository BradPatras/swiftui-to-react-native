import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider
import SwiftUI

// SwiftUI wrapper around the React Native View Controller
struct RNParkDetailsView: UIViewControllerRepresentable {
	var park: Park

	func makeUIViewController(context: Context) -> ReactNativeViewController {
		ReactNativeViewController(park: park)
	}

	func updateUIViewController(_ uiViewController: ReactNativeViewController, context: Context) {}
}

// ViewController that hosts the React Native view
class ReactNativeViewController: UIViewController {
	var reactNativeFactory: RCTReactNativeFactory?
	var reactNativeFactoryDelegate: RCTReactNativeFactoryDelegate?
	var park: Park?

	init(park: Park) {
		self.park = park
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		reactNativeFactoryDelegate = ReactNativeDelegate()
		reactNativeFactory = RCTReactNativeFactory(delegate: reactNativeFactoryDelegate!)
		reactNativeFactoryDelegate?.dependencyProvider = RCTAppDependencyProvider()
		view = reactNativeFactory!.rootViewFactory.view(
			withModuleName: "react-native-swiftui",
			initialProperties: park?.toDictionary()
		)
	}
}

class ReactNativeDelegate: RCTDefaultReactNativeFactoryDelegate {
	override func sourceURL(for bridge: RCTBridge) -> URL? {
		self.bundleURL()
	}

	override func bundleURL() -> URL? {
#if DEBUG
		RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
		Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
	}
}

extension Park {
	func toDictionary() -> [String: Any]? {
		guard let data = try? JSONEncoder().encode(self) else { return nil }
		return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
	}
}
