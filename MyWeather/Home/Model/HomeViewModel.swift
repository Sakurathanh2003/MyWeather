//
//  HomeViewModel.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct HomeViewModel {
    var weatherDay: WeatherDay?
    
    func getNameLocation() -> String? {
        guard let weatherDay = weatherDay else {
            return nil
        }

        return weatherDay.location.name
    }
    
    func getTempCurrent() -> String {
        guard let weatherDay = weatherDay else {
            return ""
        }

        return weatherDay.current.temp_c.formatted()
    }
    
    func getNumberOfItemHour() -> Int? {
        guard let hours = weatherDay?.forecast.forecastday.first?.hour else {
            return nil
        }
        
        return hours.count
    }
    
    func hourIndex(index: Int) -> HomeItemViewModel? {
        guard let hours = weatherDay?.forecast.forecastday.first?.hour else {
            return nil
        }
        
        return HomeItemViewModel(hour: hours[index])
    }
    
    func getMaxTemp() -> Double {
        guard let hours = weatherDay?.forecast.forecastday.first?.hour else {
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
        guard let hours = weatherDay?.forecast.forecastday.first?.hour else {
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
    
    func getTimeCurrent() -> Int? {
        guard let weatherDay = weatherDay else {
            return nil
        }
        
        let times = weatherDay.current.last_updated.components(separatedBy: " ")
        let time = times[1]
        let hour = time.components(separatedBy: ":")[0]
        let numberTime = (hour as NSString).integerValue
        
        return numberTime
    }
    
    func getTime(hour: HourWeather) -> Int {
        let times = hour.time.components(separatedBy: " ")
        let time = times[1]
        let hour = time.components(separatedBy: ":")[0]
        let numberTime = (hour as NSString).integerValue
        
        return numberTime
    }
    
    
    
    func getIndexCurrenCell() -> Int? {
        guard let weatherDay = weatherDay, let hours = weatherDay.forecast.forecastday.first?.hour else {
            return nil
        }
        
        let timeCurrent = getTimeCurrent()
        
        for index in 0..<hours.count {
            let hour: HourWeather = hours[index]
            let time = getTime(hour: hour)
            if time == timeCurrent {
                return index
            }
        }
        
        return nil
    }
}
