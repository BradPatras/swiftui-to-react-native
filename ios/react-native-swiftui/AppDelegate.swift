import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
		RnBridgeManager.shared.setup()
		return true
	}
}
