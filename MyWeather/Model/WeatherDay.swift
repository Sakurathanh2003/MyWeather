//
//  WeatherDay.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct WeatherDay: Decodable {
    var location: Location
    var current: CurrentWeather
    var forecast: Forecast
}
