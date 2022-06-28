//
//  Location.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

struct Location: Decodable {
    var name: String
    var region: String
    var country: String
    var lat: Double
    var lon: Double
    var tz_id: String
    var localtime_epoch: Int
    var localtime: String
}


// 9.6970387 lat
// -75.61609832592933
// vietnam
/// key f507853689d8d4bff74e54b90e9e6f72
/// https://api.openweathermap.org/data/2.5/weather?lat=9.6970387&lon=-75.61609832592933&appid=f507853689d8d4bff74e54b90e9e6f72

