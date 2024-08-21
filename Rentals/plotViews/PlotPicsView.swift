//
//  PlotPicsView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct PlotPicsView: View {
    let plot_number: String
    @StateObject var plotViewModel = PlotViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(plotViewModel.plotPics, id: \.plot_pic) { plotPic in
                    let urlString = plotPic.plot_pic
                    let url = URL(string: urlString)
                    
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        ProgressView() // Shows a loading spinner while the image loads
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .onAppear() {
            fetchPlotDetails()
        }
    }
    
    private func fetchPlotDetails() {
        PlotsApiService.shared.getPlotPics(plot_number: plot_number) { result in
            switch result {
            case .success(let plotPicResponse):
                plotViewModel.setPlotPics(plotPicResponse.plot_pics)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    PlotPicsView(plot_number: "1")
}
