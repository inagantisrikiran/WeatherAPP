//
//  WeatherService.swift
//  Weather
//
//  Created by SRIKIRAN INAGANTI on 9/14/24.
//

import Foundation
import Combine

private enum APIKEY {
    static let key = "2109ccc9a7e4a08ecc036b2510884dd5" 
}

class WeatherService {
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func getWeather(for city: String) -> AnyPublisher<WeatherResponse, Error> {
        guard let url = URL(string: "\(baseURL)?q=\(city)&appid=\(APIKEY.key)&units=metric") else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
