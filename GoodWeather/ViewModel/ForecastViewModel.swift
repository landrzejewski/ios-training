//
//  ForecastViewModel.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

final class ForecastViewModel {
    
    var title = "Good Weather"
    var entries: [ForecastEntryViewModel] = []
    var error = ""
    var view: ForecastView?
   
    private let weatherService: WeatherService
    private let iconMapper = IconMapper()
    private let cityKey = "cityName"
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMMM"
        return formatter
    }()
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
        if let cityName = UserDefaults.standard.string(forKey: cityKey) {
            refreshWeather(for: cityName)
        }
    }
    
    func refreshWeather(for city: String) {
        weatherService.getWeather(for: city, callback: onWeatherLoaded)
    }
    
    private func onWeatherLoaded(result: Result<Weather, HttpClientError>) {
        switch result {
        case .success(let weather):
            UserDefaults.standard.set(weather.city.name, forKey: cityKey)
            map(weather: weather)
            view?.updateView(with: self)
        case .failure(let error):
            print(error)
        }
    }
    
    private func map(weather: Weather) {
        title = weather.city.name
        entries = weather.forecast.map { forecast in
            let date = dateFormatter.string(from: Date(timeIntervalSince1970: forecast.date))
            let icon = iconMapper.map(icon: forecast.description.first?.icon ?? "")
            let description = forecast.description.first?.text ?? ""
            let temperature = "\(forecast.temperature.day)º"
            let pressure = "\(forecast.pressure) hPa"
            return ForecastEntryViewModel(date: date, icon: icon, description: description, temperature: temperature, pressure: pressure)
        }
    }

}
