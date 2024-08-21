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
        self.fetchedPlots = plots
    }
    
    func setNewPlots(_ plots: [Plot]) {
        self.fetchedPlots = plots
        self.originalPlots = plots
    }
    
    func setExpandedRooms(_ value: Bool) {
        self.expandedRooms = value
    }
    
    func setSelectedRoomOption(_ option: String) {
        self.selectedRoomOption = option
    }
    
    func toggleUploadedFilter() {
        self.uploadedFilter.toggle()
    }
    
    func togglePriceFilter() {
        self.priceFilter.toggle()
    }
    
    func toggleRatingFilter() {
        self.ratingFilter.toggle()
    }
}
