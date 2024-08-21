//
//  RatingsView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct RatingsView: View {
    let plot_rating: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                if index < plot_rating {
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

#Preview {
    RatingsView(plot_rating: 5)
}
