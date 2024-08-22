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
            ZStack {
                Color(UIColor.black)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    
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
}

#Preview {
    PlotScreen(plot_number: "1")
}
