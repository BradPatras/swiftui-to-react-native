import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack {
			List(Park.parks) { park in
				NavigationLink(value: park) {
					HStack {
						Text(park.emoji)
							.font(.largeTitle)
						Text(park.name)
						Spacer()
					}
				}
			}
			.navigationDestination(for: Park.self) { park in
				if park.id == 1 {
					ParkDetailsView(park: park)
				} else {
					RNParkDetailsView(park: park)
				}
			}
			.navigationTitle("Parks 🗺️")
		}
	}
}

struct Park: Equatable, Identifiable, Hashable, Codable {
	var id: Int
	var emoji: String
	var established: String
	var name: String
	var location: String
	var description: String
	var imageUrl: String

	static var parks: [Park] = [
		.init(
			id: 0,
			emoji: "🏞️",
			established: "1890",
			name: "Yosemite (React Native)",
			location: "California",
			description: "Yosemite National Park is a national park in the western Sierra Nevada mountains of Central California, in the United States.",
			imageUrl:  "https://images.unsplash.com/photo-1452535902410-1f31b87be3b5?q=80&w=2264&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
		),
		.init(
			id: 1,
			emoji: "🦬",
			established: "1872",
			name: "Yellowstone (iOS SwiftUI)",
			location: "Wyoming",
			description: "Yellowstone National Park is an American national park located in the western United States, mostly in the U.S. state of Wyoming.",
			imageUrl: "https://images.unsplash.com/photo-1560785270-a60254819f54?q=80&w=2271&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
		)
	]
}

#Preview {
    ContentView()
}
