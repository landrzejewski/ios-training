//
//  ForecastDetailsViewController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation
import UIKit

class ForecastDetailsViewController: UIViewController, UITableViewDataSource {
    
    var viewModel: ForecastViewModel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as! ForecastDetailsViewCell
        cell.updateView(viewModel: viewModel.entries[indexPath.row])
        return cell
    }
    
}
