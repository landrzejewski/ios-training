//
//  Description.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

struct Description: Codable {
    
    let text: String
    let icon: String
    
    enum CondinKeys: String, CodingKey {
        
        case text = "description"
        case icon
        
    }
    
}
