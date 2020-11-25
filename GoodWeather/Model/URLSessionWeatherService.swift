//
//  URLSessionWeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

final class URLSessionWeatherService: WeatherService {
    
    private let url = "https://api.openweathermap.org/data/2.5/forecast/daily?cnt=7&units=metric&APPID=b933866e6489f58987b2898c89f542b8&q="
   
    func getWeather(for city: String, callback: @escaping (Result<Weather, HttpClientError>) -> ()) {
        guard let requestUrl = URL(string: "\(url)\(city)") else {
            callback(.failure(.malformedUrl))
            return
        }
        let request = URLRequest(url: requestUrl)
        URLSession.shared.dataTask(with: request) { json, response, error in
            guard let data = json else {
                DispatchQueue.main.async { callback(.failure(.requestFailed)) }
                return
            }
            if let weather = try? JSONDecoder().decode(Weather.self, from: data) {
                DispatchQueue.main.async { callback(.success(weather)) }
            } else {
                DispatchQueue.main.async { callback(.failure(.parsingFailed)) }
            }
        }.resume()
    }
 
}
