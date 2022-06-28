//
//  CurrentWeather.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct CurrentWeather: Decodable {
    var last_updated: String
    var last_updated_epoch: Int
    var temp_c: Decimal
    var temp_f: Decimal
    var feelslike_c: Decimal
    var feelslike_f: Decimal
    var condition: Condition
    var wind_mph: Decimal
    var wind_kph: Decimal
    var wind_degree: Int
    var wind_dir: String
    var pressure_mb: Decimal
    var pressure_in: Decimal
    var precip_mm: Decimal
    var precip_in: Decimal
    var humidity: Int
    var cloud: Int
    var is_day: Int
    var uv: Decimal
    var gust_mph: Decimal
    var gust_kph: Decimal
}

struct Condition: Decodable {
    var text: String
    var icon: String
    var code: Int
}
