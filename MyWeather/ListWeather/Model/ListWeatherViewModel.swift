//
//  ListWeatherViewModel.swift
//  MyWeather
//
//  Created by Vu Thanh on 28/06/2022.
//

import Foundation

struct ListWeatherViewModel {
    static func makeEmpty() -> ListWeatherViewModel {
        return ListWeatherViewModel(weatherDays: [])
    }
    
    var weatherDays: [WeatherDay]
    
    mutating func addWeatherDay(weatherDay: WeatherDay) {
        self.weatherDays.append(weatherDay)
    }
}
