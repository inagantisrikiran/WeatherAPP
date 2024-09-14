//
//  ContentView.swift
//  Weather
//
//  Created by SRIKIRAN INAGANTI on 9/14/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var city: String = ""
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    private let weatherService = WeatherService()
    
    var body: some View {
        VStack {
            TextField("Enter city", text: $city, onCommit: {
                weatherViewModel.fetchWeather(city: city)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            if let weather = weatherViewModel.weather {
                Text("Weather in \(weather.name)")
                    .font(.title)
                    .padding()
                
                Text("Temperature: \(weather.main.temp, specifier: "%.1f")°C")
                    .font(.headline)
                    .padding()
                
                Text(weather.weather.first?.description.capitalized ?? "")
                    .font(.subheadline)
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
