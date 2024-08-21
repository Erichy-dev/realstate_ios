//
//  Filters.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct Filters: View {
    let viewModel: HomeViewModel
    
    var body: some View {
        HStack {
            HouseTypeFilter(viewModel: viewModel)
            
            // price button
            PriceFilter(viewModel: viewModel)
            
            // rating button
            RatingFilter(viewModel: viewModel)
            
            // uploaded button
            UploadedFilter(viewModel: viewModel)
        }
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    Filters()
//}
