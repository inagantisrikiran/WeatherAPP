//
//  WeatherViewModel.swift
//  Weather
//
//  Created by SRIKIRAN INAGANTI on 9/14/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    
    private let weatherService = WeatherService()
    private var cancellable: AnyCancellable?
    @Published var weather: WeatherResponse?
    
    func fetchWeather(city: String) {
        cancellable = weatherService.getWeather(for: city)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { weather in
                self.weather = weather
            })
    }
}


