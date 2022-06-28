//
//  HomeItemViewModel.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation
import UIKit


struct HomeItemViewModel {
    var hour: HourWeather
    
    func getTemp() -> Double {
        return hour.temp_c
    }
    
    func getTime() -> String {
        let times = hour.time.components(separatedBy: " ")
        let time = times[1]
        let hour = time.components(separatedBy: ":")[0]
        let numberTime = (hour as NSString).integerValue
        
        if numberTime <= 12 {
            return "\(numberTime) AM"
        }
        
        return "\(numberTime - 12) PM"
    }
}
