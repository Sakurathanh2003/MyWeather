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
    
    func numberOfItem() -> Int {
        return weatherDays.count
    }
    
    func itemAt(index: Int) -> ListWeatherItemViewModel {
        return ListWeatherItemViewModel(weatherDay: weatherDays[index])
    }
    
    mutating func addWeatherDay(weatherDay: [WeatherDay]) {
        for day in weatherDay {
            weatherDays.append(day)
        }
    }
}
