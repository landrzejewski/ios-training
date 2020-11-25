//
//  ForecastDetailsViewCell.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation
import UIKit

class ForecastDetailsViewCell: UITableViewCell {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func updateView(viewModel: ForecastViewModel) {
        iconLabel.text = viewModel.icon
        dateLabel.text = viewModel.date
        descriptionLabel.text = viewModel.description
        temperatureLabel.text = viewModel.temperature
        pressureLabel.text = viewModel.pressure
    }
    
}
