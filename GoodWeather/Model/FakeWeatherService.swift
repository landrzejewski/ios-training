//
//  FakeWeatherService.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 24/11/2020.
//

import Foundation

final class FakeWeatherService: WeatherService {
    
      private let json = """
      {"city":{"id":756135,"name":"Warsaw","coord":{"lon":21.0118,"lat":52.2298},"country":"PL","population":1000000,"timezone":7200},"cod":"200","message":0.0567436,"cnt":7,"list":[{"dt":1590832800,"sunrise":1590805338,"sunset":1590864307,"temp":{"day":11.13,"min":11.13,"max":11.28,"night":11.28,"eve":11.13,"morn":11.13},"feels_like":{"day":6.23,"night":4.86,"eve":6.23,"morn":6.23},"pressure":1013,"humidity":87,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"speed":6.71,"deg":344,"clouds":100,"rain":11.79},{"dt":1590919200,"sunrise":1590891685,"sunset":1590950777,"temp":{"day":14.67,"min":12.89,"max":17.01,"night":14.07,"eve":15.97,"morn":12.89},"feels_like":{"day":9.01,"night":9.4,"eve":12.28,"morn":6.63},"pressure":1012,"humidity":65,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"speed":7.47,"deg":33,"clouds":97},{"dt":1591005600,"sunrise":1590978035,"sunset":1591037245,"temp":{"day":15.71,"min":10.39,"max":17.17,"night":12.54,"eve":16.64,"morn":10.39},"feels_like":{"day":9.78,"night":8.72,"eve":10.61,"morn":5.22},"pressure":1022,"humidity":42,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":6.29,"deg":35,"clouds":0},{"dt":1591092000,"sunrise":1591064388,"sunset":1591123711,"temp":{"day":16.68,"min":10.03,"max":18.08,"night":12.91,"eve":18.03,"morn":10.03},"feels_like":{"day":11.13,"night":9.44,"eve":12.98,"morn":7.27},"pressure":1019,"humidity":34,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":5.25,"deg":32,"clouds":0},{"dt":1591178400,"sunrise":1591150743,"sunset":1591210175,"temp":{"day":17.58,"min":9.92,"max":19.14,"night":12.44,"eve":15.02,"morn":9.92},"feels_like":{"day":11.73,"night":9.65,"eve":10.49,"morn":6.74},"pressure":1011,"humidity":40,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":6.43,"deg":22,"clouds":78,"rain":0.37},{"dt":1591264800,"sunrise":1591237102,"sunset":1591296636,"temp":{"day":16.35,"min":10.91,"max":19.67,"night":15.23,"eve":19.67,"morn":10.91},"feels_like":{"day":14.67,"night":14.27,"eve":16.85,"morn":9.27},"pressure":1011,"humidity":60,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"speed":1.94,"deg":342,"clouds":93,"rain":0.3},{"dt":1591351200,"sunrise":1591323463,"sunset":1591383095,"temp":{"day":21.1,"min":12.78,"max":23.48,"night":17.97,"eve":23.48,"morn":12.78},"feels_like":{"day":18.71,"night":15.18,"eve":20.58,"morn":11.82},"pressure":1008,"humidity":41,"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01d"}],"speed":2.52,"deg":276,"clouds":2}]}
      """
    
    func getWeather(for city: String, callback: (Result<Weather, HttpClientError>) -> ()) {
        guard let data = json.data(using: .utf8) else {
            callback(.failure(.invalidData))
            return
        }
        if let weather = try? JSONDecoder().decode(Weather.self, from: data) {
            callback(.success(weather))
        } else {
            callback(.failure(.parsingFailed))
        }
    }
    
}
