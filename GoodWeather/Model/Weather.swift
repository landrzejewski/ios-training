//
//  Weather.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

struct Weather: Codable {
    
    let city: City
    let forecast: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        
        case city
        case forecast = "list"
        
    }
    
}
