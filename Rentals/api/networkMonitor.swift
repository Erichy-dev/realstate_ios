//
//  networkCalls.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import Foundation
import Network
import Combine

class NetworkMonitor: ObservableObject {
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    
    @Published var isConnected: Bool  = false

    private var isMonitoring = false
    
    private init() {}
    
    func startMonitoring() {
        if !isMonitoring {
            monitor.pathUpdateHandler = { [weak self] path in
                DispatchQueue.main.async {
                    self?.isConnected = path.status == .satisfied
                }
            }
            monitor.start(queue: queue)
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
