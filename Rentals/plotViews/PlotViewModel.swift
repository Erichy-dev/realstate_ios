//
//  PlotViewModel.swift
//  Rentals
//
//  Created by mac on 8/21/24.
//

import Foundation

class PlotViewModel: ObservableObject {
    @Published var plotPics: [PlotPic] = []
    
    func setPlotPics(_ pics: [PlotPic]) {
        self.plotPics = pics
    }
    
    // plot details
    @Published var plotDetails: Plot = Plot(
        plot_number: "",
        plot_upload_date: "",
        plot_address: "",
        plot_price: 0,
        plot_single: true,
        plot_bedsitter: false,
        plot_1B: false,
        plot_2B: false,
        plot_3B: false,
        plot_rating: 0,
        plot_bg_pic: ""
    )
    
    func setPlotDetails(_ plot_details: Plot) {
        self.plotDetails = plot_details
    }
    
    // plot caretakers
    @Published var plotCaretakers: [PlotOccupant] = []
    func setPlotCaretakers(_ plot_caretakers: [PlotOccupant]) {
        self.plotCaretakers = plot_caretakers
    }
}
