//
//  ContentView.swift
//  weatherApp
//
//  Created by shashwat singh on 07/07/24.
//
import SwiftUI

struct ContentView: View {
    @State var city: String = "patna".capitalized
    var body: some View {
        ZStack{
            FirstView(city: $city)
        }
    }
}
        #Preview {
            ContentView()
        }

