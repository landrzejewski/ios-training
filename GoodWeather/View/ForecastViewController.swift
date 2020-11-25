//
//  ForecastViewController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private let weatherService: WeatherService = URLSessionWeatherService()
    private let cityKey = "cityName"
    
    private var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(viewModel: ForecastViewModel())
        if let cityName = UserDefaults.standard.string(forKey: cityKey) {
            refreshWeather(for: cityName)
        }
    }
    
    private func onWeatherLoaded(result: Result<Weather, WeatherProviderError>) {
        switch result {
        case .success(let weather):
            self.weather = weather
            UserDefaults.standard.set(weather.city.name, forKey: cityKey)
            let forecast = ForecastViewModel(city: weather.city.name, forecast: weather.forecast[0])
            updateView(viewModel: forecast)
        case .failure(let error):
            print(error)
        }
    }
    
    private func updateView(viewModel: ForecastViewModel) {
        title = viewModel.title
        iconLabel.text = viewModel.icon
        descriptionLabel.text = viewModel.description
        temperatureLabel.text = viewModel.temperature
        pressureLabel.text = viewModel.pressure
    }
    
    @IBAction func refreshWeather(_ sender: UIButton) {
        if let city = cityTextField.text {
            refreshWeather(for: city)
        }
    }
    
    private func refreshWeather(for city: String) {
        weatherService.getWeather(for: city, callback: onWeatherLoaded)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let forecastDetailsViewController = segue.destination as? ForecastDetailsViewController {
                forecastDetailsViewController.weather = weather
            }
        }
    }
    
}
