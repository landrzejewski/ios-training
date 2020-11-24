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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshWeather(for: "warsaw")
    }
    
    private func onWeatherLoaded(result: Result<Weather, WeatherProviderError>) {
        switch result {
        case .success(let weather):
            let forecast = ForecastViewModel(forecast: weather.forecast[0])
            updateView(viewModel: forecast)
        case .failure(let error):
            print(error)
        }
    }
    
    private func updateView(viewModel: ForecastViewModel) {
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
    
}
