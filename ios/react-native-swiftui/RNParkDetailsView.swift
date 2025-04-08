import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider
import SwiftUI

// SwiftUI wrapper around the React Native View Controller
struct RNParkDetailsView: UIViewControllerRepresentable {
	var park: Park
	var isFavorite: Bool = false
	var isFavoriteUpdated: (Bool) -> Void

	func makeUIViewController(context: Context) -> ReactNativeViewController {
		ReactNativeViewController(park: park, isFavorite: isFavorite, isFavoriteUpdated: isFavoriteUpdated)
	}

	func updateUIViewController(_ uiViewController: ReactNativeViewController, context: Context) {}
}

// ViewController that hosts the React Native view
class ReactNativeViewController: UIViewController {
	var park: Park?
	var isFavorite: Bool = false
	var isFavoriteUpdated: (Bool) -> Void

	init(park: Park, isFavorite: Bool = false, isFavoriteUpdated: @escaping (Bool) -> Void) {
		self.park = park
		self.isFavorite = isFavorite
		self.isFavoriteUpdated = isFavoriteUpdated
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		var initalProps = park?.toDictionary()
		initalProps?["isFavorite"] = isFavorite

		view = RnBridgeManager.shared.createView(
			moduleName: "react-native-swiftui",
			initialProperties: initalProps
		)

		NotificationCenter.default.addObserver(
			self,
			selector: #selector(onFavoriteUpdated(notification:)),
			name: .init("parkFavoriteChanged"),
			object: nil
		)
	}

	@objc func onFavoriteUpdated(notification: Notification) {
		guard let isFavorite = notification.userInfo?["isFavorite"] as? Bool else { return }
		isFavoriteUpdated(isFavorite)
	}
}

extension Park {
	func toDictionary() -> [String: Any]? {
		guard let data = try? JSONEncoder().encode(self) else { return nil }
		return try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
	}
}
