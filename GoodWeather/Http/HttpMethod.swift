//
//  HttpMethod.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation

enum HttpMethod {
    
    case get
    case post(Data)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
    
}
