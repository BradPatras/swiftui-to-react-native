import SwiftUI

struct ParkDetailsView: View {
	@Environment(\.dismiss) var dismiss
	var park: Park
	var isFavorite: Binding<Bool>

	init(park: Park, isFavorite: Binding<Bool>) {
		self.park = park
		self.isFavorite = isFavorite
	}

	var body: some View {
		ScrollView {
			VStack(spacing: 8) {
				AsyncImage(
					url: URL(string: park.imageUrl),
					content: { image in
						image.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
					},
					placeholder: {
						ProgressView()
							.frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
					}
				)
				
				HStack {
					Text("est. \(park.established)")
					Spacer()
					Text(park.location)
					Image(systemName: "location")
				}
				.font(.footnote)
				.padding(.horizontal, 12)

				Text(park.description)
					.frame(maxWidth: .infinity, alignment: .leading)
					.multilineTextAlignment(.leading)
					.padding(.vertical, 20)
					.padding(.horizontal, 12)

				Button(isFavorite.wrappedValue ? "Remove from Favorites" : "Add to Favorites") {
					isFavorite.wrappedValue.toggle()
				}

			}
		}
		.navigationTitle(park.name)
		.navigationBarTitleDisplayMode(.inline)

		Spacer()
	}
}
