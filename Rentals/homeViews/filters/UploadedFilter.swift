//
//  UploadedFilter.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct UploadedFilter: View {
    let viewModel: HomeViewModel
    @State private var uploadedIconName = "chevron.down"
    
    var body: some View {
        Button(action: {
            viewModel.toggleUploadedFilter()
            uploadedIconName = viewModel.uploadedFilter ? "chevron.down" : "chevron.up"
            
            let sortedPlots = viewModel.fetchedPlots.sorted { (plot1: Plot, plot2: Plot) in
                if viewModel.uploadedFilter {
                    return plot1.plot_upload_date < plot2.plot_upload_date
                } else {
                    return plot1.plot_upload_date > plot2.plot_upload_date
                }
            }
            viewModel.setFetchedPlots(sortedPlots)
                }) {
                    HStack {
                        Text("Uploaded")
                            .font(.subheadline)
                        Image(systemName: uploadedIconName)
                            .font(.footnote)
                    }
                    .padding(6)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                }
    }
}
