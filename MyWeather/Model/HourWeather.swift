//
//  HourWeather.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct HourWeather: Decodable {
    var time_epoch: Int
    var time: String
    var temp_c: Double
    var temp_f: Double
    var is_day: Int // 0 là đêm, 1 là ngày
    var condition: Condition
    var wind_mph: Double
    var wind_kph: Double
    var wind_degree: Double
    var wind_dir: String
    var pressure_mb: Double
    var pressure_in: Double
    var precip_mm: Double
    var precip_in: Double
    var humidity: Int
    var cloud: Int
    var feelslike_c: Double
    var feelslike_f: Double
    var windchill_c: Double
    var windchill_f: Double
    var heatindex_c: Double
    var heatindex_f: Double
    var dewpoint_c: Double
    var dewpoint_f: Double
    var will_it_rain: Int // 1 là mưa, 0 là không mưa
    var chance_of_rain: Int
    var will_it_snow: Int // 1 là có tuyết, 0 là không có tuyết
    var chance_of_snow: Int
    var vis_km: Double
    var vis_miles: Double
    var gust_mph: Double
    var gust_kph: Double
    var uv: Double
}
