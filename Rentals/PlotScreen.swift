//
//  PlotScreen.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct PlotScreen: View {
    let plot_number: String
    @StateObject var plotViewModel = PlotViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NetworkStatusView()
                    
                    PlotPicsView(plot_number: plot_number)
                    
                    PlotDetails(plot_number: plot_number)
                }
            }
        }
    }
}

#Preview {
    PlotScreen(plot_number: "1")
}
