//
//  GeocodingClient.swift
//  Weather
//
//  Created by shashwat singh on 24/11/24.
//
import Foundation


enum NetworkError: Error {
    case invaildResponse
}

struct GeocodingClient{
    func cooridnateBycity(_ city: String) async throws ->Location? {
        let (data,response) = try await URLSession.shared.data(from: APIEndpoints.endpointURL(for: .coordinatesByCity(city)))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invaildResponse
        }
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
    }
}

