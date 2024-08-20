import Foundation

// Plot model
struct Plot: Codable, Identifiable {
    let id: String // Adding an ID for use in SwiftUI lists, optional
    let plotNumber: String
    let plotUploadDate: String
    let plotAddress: String
    let plotPrice: Int
    let plotSingle: Bool
    let plotBedsitter: Bool
    let plot1B: Bool
    let plot2B: Bool
    let plot3B: Bool
    let plotRating: Int
    let plotBgPic: String?
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
struct PlotPic: Codable, Identifiable {
    let id: String // Adding an ID for use in SwiftUI lists, optional
    let plotNumber: String
    let plotPic: String
    let plotPicDesc: String?
}

// PlotPicResponse model
struct PlotPicResponse: Codable {
    let plotPics: [PlotPic]
}

// PlotOccupant model
struct PlotOccupant: Codable, Identifiable {
    let id: String // Adding an ID for use in SwiftUI lists, optional
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
