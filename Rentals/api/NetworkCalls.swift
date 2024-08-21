//
//  GetPlots.swift
//  Rentals
//
//  Created by mac on 8/20/24.
//

import Foundation

class PlotsApiService {
    static let shared = PlotsApiService()
    private let baseUrl = "https://realstate.pythonanywhere.com/plots/"
    
    private init() {}
    
    func getPlots(completion: @escaping (Result<PlotsResponse, Error>) -> Void) {
        let urlString = "\(baseUrl)"
        performRequest(urlString: urlString, completion: completion)
    }
    
    func getPlot(plot_number: String, completion: @escaping (Result<PlotResponse, Error>) -> Void) {
        let urlString = "\(baseUrl)/plot/\(plot_number)/"
        performRequest(urlString: urlString, completion: completion)
    }
    
    func getPlotPics(plot_number: String, completion: @escaping (Result<PlotPicResponse, Error>) -> Void) {
        let urlString = "\(baseUrl)/\(plot_number)/pics/"
        performRequest(urlString: urlString, completion: completion)
    }
    
    func getPlotCaretakers(plot_number: String, completion: @escaping (Result<PlotCaretakerResponse, Error>) -> Void) {
        let urlString = "\(baseUrl)/\(plot_number)/caretakers/"
        performRequest(urlString: urlString, completion: completion)
    }
    
    private func performRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        task.resume()
    }
}
