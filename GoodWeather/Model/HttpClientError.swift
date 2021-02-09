//
//  HttpClientError.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

enum HttpClientError: Error {
    
    case invalidData
    case malformedUrl
    case parsingFailed
    case requestFailed
    
}
