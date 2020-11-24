//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

protocol WeatherService {
    
    func getWeather(for city: String, callback: @escaping (Result<Weather, WeatherProviderError>) -> ())
    
}
