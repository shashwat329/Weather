//
//  Settings.swift
//  Weather
//
//  Created by shashwat singh on 22/11/24.
//
import Foundation
import SwiftUI

struct Settings: View {
    @State var saveSettings: Bool = false
    @State var city: String = ""
    @State private var isFetchingWeather: Bool = false
    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea(.all)
            VStack(alignment: .leading){
                wave()
                    .fill(Color.blue)
                    .frame(height: 500)
                    .overlay(alignment: .top){
                        VStack{
                            Text("Change your City")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                            TextField("Enter City", text: $city)
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.gray)
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .onSubmit {
                                    isFetchingWeather = true
                                }.task(id: isFetchingWeather) {
                                    if  isFetchingWeather{
                                        print("Fetching weather for \(city)")
                                        isFetchingWeather = false
                                    }
                                    
                                }
                            NavigationLink(destination: FirstView(city: $city),isActive: $isFetchingWeather){
                                EmptyView()
                            }
                        }
                    }
                Spacer()
            }
        }
    }
}

#Preview {
    Settings()
}
