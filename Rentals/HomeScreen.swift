//
//  ContentView.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Rentals")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                Filters(viewModel: viewModel)
                
                NetworkStatusView()
                
                PlotView(viewModel: viewModel)
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .onAppear() {
            fetchPlots(viewModel: viewModel)
        }
    }
    
    private func fetchPlots(viewModel: HomeViewModel) {
        PlotsApiService.shared.getPlots{ result in
            switch result {
            case .success(let plotsResponse):
                viewModel.setNewPlots(plotsResponse.plots)
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeScreen()
}