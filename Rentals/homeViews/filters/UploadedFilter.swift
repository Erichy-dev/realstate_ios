//
//  UploadedFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct UploadedFilter: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        Button(action: {
            viewModel.toggleUploadedFilter()
            
            let sortedPlots = viewModel.fetchedPlots.sorted { (plot1: Plot, plot2: Plot) in
                if viewModel.uploadedFilter {
                    return plot1.plotUploadDate < plot2.plotUploadDate
                } else {
                    return plot1.plotUploadDate > plot2.plotUploadDate
                }
            }
            viewModel.setFetchedPlots(sortedPlots)
                }) {
                    HStack {
                        Text("Uploaded")
                            .font(.subheadline)
                        Image(systemName: viewModel.uploadedFilter ? "chevron.up" : "chevron.down")
                            .font(.footnote)
                    }
                    .padding(6)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
    }
}

#Preview {
    UploadedFilter()
}
