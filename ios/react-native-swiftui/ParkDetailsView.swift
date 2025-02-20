import SwiftUI

struct ParkDetailsView: View {
	@Environment(\.dismiss) var dismiss
	var park: Park

	init(park: Park) {
		self.park = park
	}

	var body: some View {
		VStack(spacing: 8) {
			AsyncImage(
				url: URL(string: park.imageUrl),
				content: { image in
					image.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(maxWidth: .infinity, maxHeight: 300)
				},
				placeholder: {
					ProgressView()
						.frame(maxWidth: .infinity, maxHeight: 300)
				}
			)

			HStack {
				Text("est. \(park.established)")
				Spacer()
				Text(park.location)
				Image(systemName: "location")
			}
			.font(.footnote)

			Text(park.description)
				.frame(maxWidth: .infinity, alignment: .leading)
				.multilineTextAlignment(.leading)
				.padding(.vertical, 20)
		}
		.padding(.horizontal, 12)
		.navigationTitle(park.name)
		.navigationBarTitleDisplayMode(.inline)

		Spacer()
	}
}
