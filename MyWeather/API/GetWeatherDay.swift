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
    
    init(location: String) {
        self.loadLocation(location: location)
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
    
    func loadLocation(location: String) {
        let locationAPI = location.replacingOccurrences(of: " ", with: "%20")
        let api = "http://api.weatherapi.com/v1/forecast.json?key=084c278d4d264b14b80134021222706&q=\(locationAPI)&days=1&aqi=no&alerts=no"
        guard let url = URL(string: api) else {
            return
        }
        print(api)


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
