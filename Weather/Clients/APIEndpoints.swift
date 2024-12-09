//
//  APIEndpoints.swift
//  Weather
//
//  Created by shashwat singh on 24/11/24.
//

import Foundation

enum APIEndpoints {
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByCity(String)
    case weatherbyLatLon(Double,Double)
    private var path: String {
        switch self {
        case .coordinatesByCity(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherbyLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    static func endpointURL(for endpoint: APIEndpoints) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
}
