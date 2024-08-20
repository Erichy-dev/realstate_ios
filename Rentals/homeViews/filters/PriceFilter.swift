//
//  PriceFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct PriceFilter: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        Button(action: {
            viewModel.togglePriceFilter()
            let sortedPlots = viewModel.fetchedPlots.sorted { (plot1: Plot, plot2: Plot) in
                if viewModel.priceFilter {
                    return plot1.plot_price < plot2.plot_price
                } else {
                    return plot1.plot_price > plot2.plot_price
                }
            }
            viewModel.setFetchedPlots(sortedPlots)
                }) {
                    HStack {
                        Text("Price")
                            .font(.subheadline)
                        Image(systemName: viewModel.priceFilter ? "chevron.up" : "chevron.down")
                            .font(.footnote)
                    }
                    .padding(6)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
    }
}

#Preview {
    PriceFilter()
}
