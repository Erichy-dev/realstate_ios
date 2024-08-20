//
//  ContentView.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Rentals")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .frame(width: .infinity, alignment: .topLeading)
                
                HStack {
                    Button(action: {
                            }) {
                                HStack {
                                    Text("Bedsitter")
                                        .font(.subheadline)
                                    Image(systemName: "chevron.down")
                                        .font(.footnote)
                                }
                                .padding(6)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                    
                    // price button
                    Button(action: {
                            }) {
                                HStack {
                                    Text("Price")
                                        .font(.subheadline)
                                    Image(systemName: "chevron.down")
                                        .font(.footnote)
                                }
                                .padding(6)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                    
                    // rating button
                    Button(action: {
                            }) {
                                HStack {
                                    Text("Rating")
                                        .font(.subheadline)
                                    Image(systemName: "chevron.down")
                                        .font(.footnote)
                                }
                                .padding(6)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
                    
                    // uploaded button
                    Button(action: {
                            }) {
                                HStack {
                                    Text("Uploaded")
                                        .font(.subheadline)
                                    Image(systemName: "chevron.down")
                                        .font(.footnote)
                                }
                                .padding(6)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                            }
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
    ContentView()
}
