import Foundation
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider

class RnBridgeManager {
	public static let shared = RnBridgeManager()

	private var factory: RCTReactNativeFactory?
	private let delegate: RnFactoryDelegate

	public init() {
		delegate = RnFactoryDelegate()
		delegate.dependencyProvider = RCTAppDependencyProvider()
	}

	public func setup() {
		print("### Setting up factory...")
		factory = RCTReactNativeFactory(delegate: delegate)
		print("### Factory setup complete.")
	}

	public func createView(moduleName: String, initialProperties: [String: Any]?) -> UIView {
		let viewFactory: RCTReactNativeFactory
		if let existingFactory = self.factory {
			print("### Using existing factory.")
			viewFactory = existingFactory
		} else {
			print("### Factory not initialized. Setting up factory...")
			viewFactory = RCTReactNativeFactory(delegate: delegate)
			print("### Factory setup complete.")
			self.factory = viewFactory
		}

		return viewFactory.rootViewFactory.view(withModuleName: moduleName, initialProperties: initialProperties ?? [:])
	}
}

class RnFactoryDelegate: RCTDefaultReactNativeFactoryDelegate {
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
