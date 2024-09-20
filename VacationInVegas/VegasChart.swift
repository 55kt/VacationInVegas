import SwiftUI
import Charts

struct SampleRating {
    let place: String
    let rating: Int
    
    static let ratings: [SampleRating] = [
        SampleRating(place: "Bellagio", rating: 5),
        SampleRating(place: "Excalibur", rating: 4),
        SampleRating(place: "Luxor", rating: 3),
        SampleRating(place: "Paris", rating: 2),
        SampleRating(place: "Stratosphere", rating: 1),
        SampleRating(place: "TreasureIsland", rating: 0)
    ]
}

struct VegasChart: View {
    var body: some View {
        Chart(SampleRating.ratings, id: \.place) { rating in
            SectorMark(angle: .value("Ratings", rating.rating), innerRadius: .ratio(0.5), angularInset: 1)
                .cornerRadius(7)
                .foregroundStyle(by: .value("Place", rating.place))
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    VegasChart()
}
