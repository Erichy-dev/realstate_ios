//
//  NetworkStatusView.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import SwiftUI

struct NetworkStatusView: View {
    @ObservedObject var networkMonitor = NetworkMonitor.shared
    
    var body: some View {
        VStack {
            if !networkMonitor.isConnected {
                Text("No Internet Connection")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            networkMonitor.startMonitoring()
        }
        .onDisappear {
            networkMonitor.stopMonitoring()
        }
    }
}

#Preview {
    NetworkStatusView()
}
