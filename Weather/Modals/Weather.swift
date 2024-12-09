//
//  Weather.swift
//  Weather
//
//  Created by shashwat singh on 27/11/24.
//
import Foundation


struct WeatherResponse: Decodable {
    let main: Main
    let weather: [WeatherDetail]
    
    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    struct WeatherDetail: Decodable {
        let description: String
    }
}
