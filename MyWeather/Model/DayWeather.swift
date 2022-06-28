//
//  DayWeather.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct DayWeather: Decodable {
    var maxtemp_c: Double
    var maxtemp_f: Double
    var mintemp_c: Double
    var mintemp_f: Double
    var avgtemp_c: Double
    var avgtemp_f: Double
    var maxwind_mph: Double
    var maxwind_kph: Double
    var totalprecip_mm: Double
    var totalprecip_in: Double
    var avgvis_km: Double
    var avgvis_miles: Double
    var avghumidity: Int
    var daily_will_it_rain: Double
    var daily_chance_of_rain: Double
    var daily_will_it_snow: Double
    var daily_chance_of_snow: Double
    var condition: Condition
    var uv: Double
}
