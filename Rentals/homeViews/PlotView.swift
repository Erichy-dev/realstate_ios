//
//  PlotView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

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
    
                        ZStack {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } placeholder: {
                                ProgressView() // Shows a loading spinner while the image loads
                            }
    
                            Color.black.opacity(0.5)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
    
                            VStack {
                                Text(plot.plot_type)
                                Text("Ksh.\(plot.plot_price)")
                                HStack(spacing: 2) {
                                    ForEach(0..<5) { index in
                                        if index < plot.plot_rating {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        } else {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
