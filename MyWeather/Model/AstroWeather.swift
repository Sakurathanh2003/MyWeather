//
//  AstroWeather.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct AstroWeather: Decodable {
    var sunrise: String
    var sunset: String
    var moonrise: String
    var moonset: String
    var moon_phase: String
    var moon_illumination: String
}
