//
//  PriceFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct PriceFilter: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var priceIconName = "chevron.up"
    
    var body: some View {
        Button(action: {
            viewModel.togglePriceFilter()
            priceIconName = viewModel.priceFilter ? "chevron.down" : "chevron.up"
            
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
                Image(systemName: priceIconName)
                    .font(.footnote)
            }
            .padding(6)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(6)
        }
    }
}
