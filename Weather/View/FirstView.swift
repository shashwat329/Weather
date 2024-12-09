//
//  FirstView.swift
//  weatherApp
//
//  Created by shashwat singh on 07/08/24.
//

import SwiftUI
import os
struct FirstView: View {
    @Binding var city: String
    @State private var isFetchingWeather: Bool = false
    @State var temp: Double = 20
    @State var weather: WeatherResponse?
    @State var maxtemp : Int = 25
    @State var mintemp: Int = 16
    @State var weatherstatus : String = "cloudy"
    let geocoordinates =  GeocodingClient()
    let weatherClient = WeatherClient()
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    wave()
                        .fill(Color.blue)
                        .frame(height: 420)
                        .shadow( radius: 5, x: 0, y: 5)
                        .overlay{
                            VStack(spacing: 0){
                                HStack{
                                    NavigationLink( destination: Settings()){
                                        Image(systemName: "gear")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    }
                                    Spacer()
                                    Text("\(city)")
                                        .font(.system(size: 40))
                                    Spacer()
                                    NavigationLink(destination: ContentView()){
                                        Image(systemName: "person")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                .padding(.horizontal)
                                Spacer()
                                HStack(alignment:.top){
                                    if !city.isEmpty{
                                        Text("\(String(format: "%.0f",temp))°")
                                            .font(.system(size: 60))
                                    }
                                }
                                HStack{
                                    HStack(alignment:.top){
                                        Text("\(mintemp)")
                                            .font(.system(size: 20))
                                        Circle()
                                            .stroke(lineWidth: 2)
                                            .frame(width: 5)
                                    }
                                    Spacer()
                                    Text(weatherstatus)
                                        .font(.title3)
                                    Spacer()
                                    HStack(alignment:.top){
                                        Text("\(maxtemp)")
                                            .font(.system(size: 20))
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .frame(width: 5)
                                    }
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .padding(.top,57)
                        }
                    
                    Spacer()
                    secondView()
                    Spacer()
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
        .task {
            await loadWeather()
        }
    }
    
     private func loadWeather() async {
         isFetchingWeather = true
         defer { isFetchingWeather = false }
         
         do {
             // Fetch the coordinates based on the city name
             guard let location = try await geocoordinates.cooridnateBycity(city) else {
                 print("Could not find coordinates for city: \(city)")
                 return
             }
             
             // Fetch weather based on the coordinates
             let weatherResponse = try await weatherClient.fetchWeather(location)
             DispatchQueue.main.async {
                 self.weather = weatherResponse
                 self.temp = weatherResponse.main.temp - 273.15
                 self.maxtemp = Int(weatherResponse.main.temp_max - 273.15)
                 self.mintemp = Int(weatherResponse.main.temp_min - 273.15)
                 self.weatherstatus = weatherResponse.weather.first?.description ?? "Unknown"
             }
         } catch {
             print("Error fetching weather: \(error)")
         }
     }
}
