//
//  PlotPicsView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI
import Kingfisher

struct PlotPicsView: View {
    let plot_number: String
    @StateObject var plotViewModel = PlotViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                ForEach(plotViewModel.plotPics, id: \.plot_pic) { plotPic in
                    let urlString = plotPic.plot_pic
                    let url = URL(string: urlString)
                    
                    KFImage(url)
                        .placeholder{
                            ProgressView()
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
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
                print(plotPicResponse.plot_pics[0].plot_pic)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    PlotPicsView(plot_number: "1")
}
