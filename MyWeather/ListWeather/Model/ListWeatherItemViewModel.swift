//
//  ListWeatherItemViewModel.swift
//  MyWeather
//
//  Created by Vu Thanh on 28/06/2022.
//

import Foundation

struct ListWeatherItemViewModel {
    var weatherDay: WeatherDay
    
    func getTempCurrent() -> String {
        return weatherDay.current.temp_c.formatted()
    }
    
    func getNameLocation() -> String? {
        return weatherDay.location.name
    }
    
    func getMaxTemp() -> Double {
        guard let hours = weatherDay.forecast.forecastday.first?.hour else {
            return 0
        }
        
        var max: Double = 0
        
        for hour in hours {
            let temp = hour.temp_c
            if max < temp {
                max = temp
            }
        }
        
        return max
    }
    
    func getMinTemp() -> Double {
        guard let hours = weatherDay.forecast.forecastday.first?.hour else {
            return 0
        }
        
        var min: Double = 100
        
        for hour in hours {
            let temp = hour.temp_c
            if min > temp {
                min = temp
            }
        }
        
        return min
    }
    
    func getDescription() -> String {
        return weatherDay.current.condition.text
    }

}
