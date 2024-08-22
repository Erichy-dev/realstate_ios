//
//  PlotView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI
import Kingfisher

struct PlotView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.fetchedPlots, id: \.plot_number) { plot in
                        let urlString = plot.plot_bg_pic
                        let url = URL(string: urlString!)
    
                        NavigationLink(destination: PlotScreen(plot_number: plot.plot_number)) {
                            ZStack {
                                KFImage(url)
                                    .placeholder{
                                        ProgressView()
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                Color.black.opacity(0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                VStack {
                                    Text(plot.plot_type)
                                        .foregroundColor(.white)
                                    Text("Ksh.\(plot.plot_price)")
                                        .foregroundColor(.white)
                                    RatingsView(plot_rating: plot.plot_rating)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
                .frame(minHeight: reader.size.height)
                
                Link("Privacy Policy", destination: URL(string: "https://github.com/Erichy-dev/realestate_kotlin/")!)
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.vertical, 10)
            }
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        
    }
}
