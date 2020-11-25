//
//  WeatherProviderError.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

enum WeatherProviderError: Error {
   
    case invalidData
    case parsingFailed
    case malformedUrl
    case requestFailed
        
}
