//
//  HouseTypeFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct HouseTypeFilter: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Menu {
                Button(action: {
                    viewModel.setSelectedRoomOption("Single")
                    viewModel.setFetchedPlots(viewModel.originalPlots.filter { plot in plot.plotSingle })
                }) {
                    Text("Single")
                }
                
                Button(action: {
                    viewModel.setSelectedRoomOption("Bedsitter")
                    viewModel.setFetchedPlots(viewModel.originalPlots.filter { plot in plot.plotBedsitter })
                }) {
                    Text("Bedsitter")
                }
                
                Button(action: {
                    viewModel.setSelectedRoomOption("1 Bedroom")
                    viewModel.setFetchedPlots(viewModel.originalPlots.filter { plot in plot.plot1B })
                }) {
                    Text("1 Bedroom")
                }
                
                Button(action: {
                    viewModel.setSelectedRoomOption("2 Bedroom")
                    viewModel.setFetchedPlots(viewModel.originalPlots.filter { plot in plot.plot2B })
                }) {
                    Text("2 Bedroom")
                }
                
                Button(action: {
                    viewModel.setSelectedRoomOption("Bedsitter")
                    viewModel.setFetchedPlots(viewModel.originalPlots.filter { plot in plot.plotBedsitter })
                }) {
                    Text("Reset")
                }
                
            } label: {
                HStack {
                    Text(viewModel.selectedRoomOption)
                        .font(.subheadline)
                    Image(systemName: "chevron.down")
                        .font(.footnote)
                }
                .padding(6)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
        }
    }
}

#Preview {
    HouseTypeFilter()
}