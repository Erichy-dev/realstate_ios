//
//  PlotDetails.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct PlotDetails: View {
    let plot_number: String
    @StateObject var plotViewModel = PlotViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            RatingsView(plot_rating: plotViewModel.plotDetails.plot_rating)
            
            Text("Plot Contacts")
                .padding(.horizontal, 20)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Group {
                HStack {
                    Text("Caretakers")
                    
                    Spacer()
                    
                    VStack(spacing: 5) {
                        ForEach(plotViewModel.plotCaretakers, id: \.plot_occupant_phone) {caretaker in
                            Text("\(caretaker.plot_occupant_phone)")
                        }
                    }
                }
                .padding(20)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .onAppear(){
            fetchPlotDetails()
            fetchPlotCaretakers()
        }
    }
    
    private func fetchPlotDetails() {
        PlotsApiService.shared.getPlot(plot_number: plot_number) { result in
            switch result {
            case .success(let plotResponse):
                plotViewModel.setPlotDetails(plotResponse.plot)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchPlotCaretakers() {
        PlotsApiService.shared.getPlotCaretakers(plot_number: plot_number) { result in
            switch result {
            case .success(let plotCaretakersResponse):
                plotViewModel.setPlotCaretakers(plotCaretakersResponse.caretakers)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    PlotDetails(plot_number: "1")
}
