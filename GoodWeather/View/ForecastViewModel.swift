//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

struct ForecastViewModel {
    
    let title: String
    let date: String
    let icon: String
    let description: String
    let temperature: String
    let pressure: String
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMMM"
        return formatter
    }()
    
    private let iconMapper = IconMapper()
    
    init() {
        title = "Good Weather"
        date = ""
        icon = ""
        description = "No data"
        temperature = ""
        pressure = ""
    }
    
    init(city: String, forecast: Forecast) {
        title = city
        date = dateFormatter.string(from: Date(timeIntervalSince1970: forecast.date))
        if let forecastDescription = forecast.description.first {
            icon = iconMapper.map(icon: forecastDescription.icon)
            description = forecastDescription.text
        } else{
            icon = ""
            description = ""
        }
        temperature = "\(forecast.temperature.day)º"
        pressure = "\(forecast.pressure) hPa"
    }
    
}
