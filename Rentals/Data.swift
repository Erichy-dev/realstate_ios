import Foundation

// Plot model
struct Plot: Codable {
    let plot_number: String
    let plot_upload_date: String
    let plot_address: String
    let plot_price: Int
    let plot_single: Bool
    let plot_bedsitter: Bool
    let plot_1B: Bool
    let plot_2B: Bool
    let plot_3B: Bool
    let plot_rating: Int
    let plot_bg_pic: String?
}

// PlotsResponse model
struct PlotsResponse: Codable {
    let plots: [Plot]
}

// PlotResponse model
struct PlotResponse: Codable {
    let plot: Plot
}

// PlotPic model
struct PlotPic: Codable {
    let plotNumber: String
    let plotPic: String
    let plotPicDesc: String?
}

// PlotPicResponse model
struct PlotPicResponse: Codable {
    let plotPics: [PlotPic]
}

// PlotOccupant model
struct PlotOccupant: Codable {
    let plotNumber: String
    let plotOccupantId: String
    let plotOccupantFName: String
    let plotOccupantLName: String?
    let plotOccupantClass: String
    let plotOccupantPhone: String
    let plotOccupantEmail: String?
}

// PlotCaretakerResponse model
struct PlotCaretakerResponse: Codable {
    let caretakers: [PlotOccupant]
}

// FailedRequest model
struct FailedRequest: Codable {
    let error: String
}
