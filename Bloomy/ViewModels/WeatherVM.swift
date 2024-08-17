//
//  WeatherVM.swift
//  Bloomy
//
//  Created by Heical Chandra on 13/08/24.
//

import Foundation
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    private let apiKey = "aee4a3b0bfa61d90dbcb16553b6fff8e"
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
    
    func mapWeatherCondition(description: String) -> String {
        switch description {
        case "Thunderstorm", "Drizzle", "Rain", "Snow", "Squall", "Tornado":
            return "Rain"
        case "Mist", "Smoke", "Haze", "Fog", "Ash", "Clouds", "few clouds", "broken clouds", "scattered clouds":
            return "Overcast"
        case "Dust", "Sand", "Clear", "clear sky":
            return "Sunny"
        default:
            return description
        }
    }
}

func getCompassDirection(degrees: Double) -> String {
    let directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "N"]
    let index = Int((degrees + 11.25) / 22.5) % 16
    return directions[index]
}
