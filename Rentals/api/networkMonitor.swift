//
//  networkCalls.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor = NWPathMonitor()
    private var isMonitoring = false
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }
    
    func startMonitoring() {
        if !isMonitoring {
            monitor.start(queue: DispatchQueue.global(qos: .background))
            isMonitoring = true
        }
    }
    
    func stopMonitoring() {
        if isMonitoring {
            monitor.cancel()
            isMonitoring = false
        }
    }
}
