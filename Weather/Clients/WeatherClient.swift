//
//  WeatherClient.swift
//  Weather
//
//  Created by shashwat singh on 27/11/24.
//

import Foundation

struct WeatherClient{
    func fetchWeather(_ location: Location) async throws -> WeatherResponse{
        let (data,response) = try await URLSession.shared.data(from: APIEndpoints.endpointURL(for: .weatherbyLatLon(location.lat, location.lon)))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invaildResponse
        }
        let weatherResponse = try JSONDecoder().decode( WeatherResponse.self, from: data)
        return weatherResponse
    }
}
