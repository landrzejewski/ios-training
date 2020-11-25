//
//  HttpClientWeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation

final class HttpClientWeatherService: WeatherService {
    
    private let httpClient = HttpClient()
    private let url = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8&q="
   
    
    func getWeather(for city: String, callback: @escaping (Result<Weather, HttpClientError>) -> ()) {
        httpClient.request(with: RequestConfig(url: "\(url)\(city)", method: .get), completionHandler: callback)
    }
    
}
