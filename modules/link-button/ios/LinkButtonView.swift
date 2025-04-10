import ExpoModulesCore
import WebKit
import UIKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class LinkButtonView: ExpoView {
	let stack = UIStackView()
	let linkButton = UIButton()
	var url: URL? = nil

	required init(appContext: AppContext? = nil) {
		super.init(appContext: appContext)
		clipsToBounds = true
		linkButton.addTarget(self, action: #selector(onPress), for: .touchUpInside)
		linkButton.setTitleColor(UIColor.systemBlue, for: .normal)

		addSubview(linkButton)
	}

	override func layoutSubviews() {
		linkButton.frame = bounds
	}

	func updateTitle(title: String?) {
		linkButton.setTitle(title, for: .normal)
	}

	@objc func onPress() {
		if let url {
			UIApplication.shared.open(url)
		}
	}
}
