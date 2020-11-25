//
//  ForecastViewController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import UIKit

class ForecastViewController: UIViewController, ForecastView {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private let viewModel = ForecastViewModel(weatherService: HttpClientWeatherService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        updateView(with: viewModel)
    }
    
    func updateView(with viewModel: ForecastViewModel) {
        title = viewModel.title
        if let forecast = viewModel.entries.first {
            iconLabel.text = forecast.icon
            descriptionLabel.text = forecast.description
            temperatureLabel.text = forecast.temperature
            pressureLabel.text = forecast.pressure
        }
    }
    
    @IBAction func refreshWeather(_ sender: UIButton) {
        if let city = cityTextField.text {
            view.endEditing(true)
            viewModel.refreshWeather(for: city)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let forecastDetailsViewController = segue.destination as? ForecastDetailsViewController {
                forecastDetailsViewController.viewModel = viewModel
            }
        }
    }
    
}
