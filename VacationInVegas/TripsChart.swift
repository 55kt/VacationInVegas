import SwiftUI
import Charts

struct SampleTripRating {
    let trip: Int
    let rating: Int
    
    static let ratings: [SampleTripRating] = [
        SampleTripRating(trip: 1, rating: 5),
        SampleTripRating(trip: 2, rating: 4),
        SampleTripRating(trip: 3, rating: 3),
        SampleTripRating(trip: 4, rating: 2),
        SampleTripRating(trip: 5, rating: 1),
        SampleTripRating(trip: 6, rating: 0)
    ]
}

struct TripsChart: View {
    var body: some View {
        Chart(SampleTripRating.ratings, id: \.trip) { rating in
            BarMark(x: .value("Year", rating.trip),
                      y: .value("Rating", rating.rating)
            )
            
            LinePlot(x: "Years", y: "Ratings") { x in
                return x * 6 + 50
            }
            .foregroundStyle(.purple)
        }
        .chartXScale(domain: 1...5)
        .chartYScale(domain: 0...100)
        .padding()
    }
}

#Preview {
    TripsChart()
}
