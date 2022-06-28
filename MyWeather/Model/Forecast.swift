//
//  Forecast.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct Forecast: Decodable {
    var forecastday: [ForecastDay]
}
