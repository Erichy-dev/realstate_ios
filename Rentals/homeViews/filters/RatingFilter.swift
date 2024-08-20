//
//  RatingFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct RatingFilter: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        Button(action: {
            viewModel.toggleRatingFilter()
            viewModel.setFetchedPlots(viewModel.fetchedPlots.sorted { (plot1: Plot, plot2: Plot) in
                if viewModel.ratingFilter {
                    return plot1.plot_rating < plot2.plot_rating
                } else {
                    return plot1.plot_rating > plot2.plot_rating
                }
            })
                }) {
                    HStack {
                        Text("Rating")
                            .font(.subheadline)
                        Image(systemName: viewModel.ratingFilter ? "chevron.up" : "chevron.down")
                            .font(.footnote)
                    }
                    .padding(6)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
    }
}

#Preview {
    RatingFilter()
}
