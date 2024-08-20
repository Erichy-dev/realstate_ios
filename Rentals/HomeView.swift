//
//  ContentView.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Rentals")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                Filters()
                
                // list of plots
                List {
                    ForEach(viewModel.fetchedPlots, id: \.plot_number) { plot in
                        Text(plot.plot_number)
                    }
                }
                
                Spacer()
                
                // privacy policy link
                Link("Privacy Policy", destination: URL(string: "https://github.com/Erichy-dev/realestate_kotlin/")!)
                    .font(.footnote)
                    .foregroundColor(.blue)
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
                viewModel.setFetchedPlots(plotsResponse.plots)
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView()
}
