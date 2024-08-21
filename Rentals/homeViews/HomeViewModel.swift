//
//  HomeViewModel.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var fetchedPlots: [Plot] = []
    @Published var originalPlots: [Plot] = []
    
    @Published var expandedRooms: Bool = false
    @Published var selectedRoomOption: String = "Bedsitter"
    
    @Published var uploadedFilter: Bool = true
    @Published var priceFilter: Bool = false
    @Published var ratingFilter: Bool = false
    
    func setFetchedPlots(_ plots: [Plot]) {
        DispatchQueue.main.async {
            self.fetchedPlots = plots
        }
    }
    
    func setNewPlots(_ plots: [Plot]) {
        DispatchQueue.main.async {
            self.fetchedPlots = plots
            self.originalPlots = plots
        }
    }
    
    func setExpandedRooms(_ value: Bool) {
        DispatchQueue.main.async {
            self.expandedRooms = value
        }
    }
    
    func setSelectedRoomOption(_ option: String) {
        DispatchQueue.main.async {
            self.selectedRoomOption = option
        }
    }
    
    func toggleUploadedFilter() {
        DispatchQueue.main.async {
            self.uploadedFilter.toggle()
        }
    }
    
    func togglePriceFilter() {
        DispatchQueue.main.async {
            self.priceFilter.toggle()
        }
    }
    
    func toggleRatingFilter() {
        DispatchQueue.main.async {
            self.ratingFilter.toggle()
        }
    }
}
