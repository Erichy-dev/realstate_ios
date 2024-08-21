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
    
    var plot_type: String {
        if plot_single {
            return "Single"
        } else if plot_bedsitter {
            return "Bedsitter"
        } else if plot_1B {
            return "1 Bedroom"
        } else if plot_2B {
            return "2 Bedroom"
        } else if plot_3B {
            return "3 Bedroom"
        } else {
            return "Unknown"
        }
    }
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
    let plot_number: String
    let plot_pic: String
    let Plot_pic_desc: String?
}

// PlotPicResponse model
struct PlotPicResponse: Codable {
    let plot_pics: [PlotPic]
}

// PlotOccupant model
struct PlotOccupant: Codable {
    let plot_number: String
    let plot_occupant_id: String
    let plot_occupant_f_name: String
    let plot_occupant_l_name: String?
    let plot_occupant_class: String
    let plot_occupant_phone: String
    let plot_occupant_email: String?
}

// PlotCaretakerResponse model
struct PlotCaretakerResponse: Codable {
    let caretakers: [PlotOccupant]
}

// FailedRequest model
struct FailedRequest: Codable {
    let error: String
}
