//
//  ContentView.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Rentals")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
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
                
                Spacer()
                
                // privacy policy link
                Link("Privacy Policy", destination: URL(string: "https://github.com/Erichy-dev/realestate_kotlin/")!)
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    HomeView()
}
