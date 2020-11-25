//
//  ForecastDetailsViewController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation
import UIKit

class ForecastDetailsViewController: UIViewController, UITableViewDataSource {
    
    var weather: Weather?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather?.forecast.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell")!
        let forecast = weather?.forecast[indexPath.row]
       // cell.textLabel?.text = forecast?.description.first?.text ?? ""
        return cell
    }
    
}
