//
//  PlotScreen.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct PlotScreen: View {
    let plot_number = "1"
    
    var body: some View {
        NavigationView {
            Text("plot view")
        }
        .onAppear() {
            fetchPlotDetails()
        }
    }
    
    private func fetchPlotDetails() {
        PlotsApiService.shared.getPlot(plot_number: plot_number) { result in
            switch result {
            case .success(let plotResponse):
                print(plotResponse.plot)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

#Preview {
    PlotScreen()
}
