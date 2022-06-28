//
//  ForecastDay.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct ForecastDay: Decodable {
    var date: String
    var date_epoch: Int
    var day: DayWeather
    var astro: AstroWeather
    var hour: [HourWeather]
}
