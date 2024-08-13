//
//  WeatherModel.swift
//  Bloomy
//
//  Created by Heical Chandra on 13/08/24.
//

//import Foundation
//
//struct WeatherResponse: Codable {
//    let main: Main
//    let weather: [Weather]
//    let name: String
//}
//
//struct Main: Codable {
//    let temp: Double
//    let humidity: Int
//}
//
//struct Weather: Codable {
//    let description: String
//    let icon: String
//}


import Foundation

struct WeatherResponse: Codable {
    let name: String           // City name
    let main: Main             // Temperature, humidity
    let weather: [Weather]     // Weather description
    let wind: Wind             // Wind speed and direction
    let sys: Sys               // Country information
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
    let icon: String
}

struct Wind: Codable {
    let speed: Double          // Wind speed in meter/sec
    let deg: Double            // Wind direction in degrees
}

struct Sys: Codable {
    let country: String        // Country code
}
