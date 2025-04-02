import SwiftUI

struct ContentView: View {
	@State private var favorites: Set<Int> = Set()

	private func isFavoriteBinding(_ park: Park) -> Binding<Bool> {
		.init(
			get: {
				favorites.contains(park.id)
			}, set: { newValue in
				if newValue {
					favorites.insert(park.id)
				} else {
					favorites.remove(park.id)
				}
			}
		)
	}

	var body: some View {
		NavigationStack {
			List(Park.parks) { park in
				NavigationLink(value: park) {
					HStack {
						Text(park.emoji)
							.font(.largeTitle)
						Text(park.name)
						Spacer()
						if favorites.contains(park.id) {
							Image(systemName: "star.fill")
								.foregroundColor(.yellow)
						}
					}
				}
			}
			.navigationDestination(for: Park.self) { park in
				if park.id == 1 {
					ParkDetailsView(
						park: park,
						isFavorite: isFavoriteBinding(park)
					)
				} else {
					RNParkDetailsView(park: park, isFavorite: favorites.contains(park.id)) { isFavorite in
						if isFavorite {
							favorites.insert(park.id)
						} else {
							favorites.remove(park.id)
						}
					}
				}
			}
			.navigationTitle("Parks 🗺️")
		}
	}
}

#Preview {
    ContentView()
}
