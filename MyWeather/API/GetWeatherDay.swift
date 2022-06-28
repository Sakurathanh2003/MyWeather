//
//  GetWeatherDay.swift
//  MyWeather
//
//  Created by Vu Thanh on 27/06/2022.
//

import Foundation

public class GetWeatherDay: ObservableObject {
    var weatherDays = [WeatherDay]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = URL(string: API.api) else {
            return
        }

        do {
            let dataUrl = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let urlDataFromJson = try jsonDecoder.decode(WeatherDay.self, from: dataUrl)

            self.weatherDays.removeAll()
            self.weatherDays.append(urlDataFromJson)
        } catch {
            print(error)
        }
    }
    
    func getViewModel() -> HomeViewModel {
        return HomeViewModel(weatherDay: weatherDays.first)
    }
}
