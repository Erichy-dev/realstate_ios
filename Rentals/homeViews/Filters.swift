//
//  Filters.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct Filters: View {
    var body: some View {
        HStack {
            HouseTypeFilter()
            
            // price button
            PriceFilter()
            
            // rating button
            RatingFilter()
            
            // uploaded button
            UploadedFilter()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    Filters()
}
