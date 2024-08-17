//
//  WeatherBox.swift
//  Bloomy
//
//  Created by Heical Chandra on 13/08/24.
//

import SwiftUI

struct WeatherBox: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var weatherVM = WeatherViewModel()
    @State private var isLoad:Bool = false

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if !isLoad{
                    Text("Fetching weather for your location...")
                        .onAppear {
                            weatherVM.fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                        }
                }
                
                if let weather = weatherVM.weather {
                    VStack {
                        HStack {
                            HStack{
                                Image("locationIcon")
                                    .resizable()
                                    .frame(width: 18, height: 20.85)
                                Text("\(weather.name), \(weather.sys.country)")
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .foregroundColor(.biru3)
                            }

                            Spacer()
                            VStack{
                                Text("\(weatherVM.mapWeatherCondition(description: weather.weather.first?.main ?? ""))")
                                    .font(.system(size: 16))
                                    .foregroundColor(.biru3)
                            }
                        }
                        
                        HStack{
                            Text("\(weather.main.temp, specifier: "%.1f")°C")
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                                .foregroundColor(.biru3)
                            Spacer()
                            Image("dayIcon")
                        }
                        .padding(.vertical, -0.1)
                        HStack{
                            HStack{
                                Image("subicon1")
                                    .resizable()
                                    .frame(width: 15, height: 19)
                                Spacer()
                                Text("\(weather.main.humidity)%")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .padding(.horizontal)
                            .background(.biru8)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.biru3, lineWidth: 2) // Border outline
                            )
                            HStack{
                                Image("subicon2")
                                    .resizable()
                                    .frame(width: 15, height: 19)
                                Text("\(weather.wind.speed, specifier: "%.1f") m/s")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .background(.biru8)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.biru3, lineWidth: 2) // Border outline
                            )
                            HStack{
                                Image("subicon3")
                                    .resizable()
                                    .frame(width: 15, height: 19)
                                Spacer()
                                Text("\(getCompassDirection(degrees: weather.wind.deg))")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .padding(.horizontal)
                            .background(.biru8)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.biru3, lineWidth: 2) // Border outline
                            )
                        }
                        .foregroundColor(.biru3)
                        .padding(.vertical, 3)
                        Text("Safe to sail")
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.biru3)
                            .background(.biru8)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.biru3, lineWidth: 2) // Border outline
                            )
                    }
                    .onAppear{
                        isLoad = true
                    }

                } else {
                    Text("No weather data available")
                        .foregroundColor(.gray)
                }
            } else {
                Text("Retrieving your location...")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 185)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 5)
        .padding()
        
    }
}

#Preview {
    WeatherBox()
        .background(.biru3)
}
