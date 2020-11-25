//
//  HttpClient.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 25/11/2020.
//

import Foundation

final class HttpClient {
    
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init(encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) {
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func request<R: Decodable>(with config: RequestConfig, completionHandler: @escaping (Result<R, HttpClientError>) -> ()) {
        guard let url = URL(string: config.url) else {
            completionHandler(.failure(.malformedUrl))
            return
        }
        let httpRequest = createRequest(for: url, method: config.method)
        execute(request: httpRequest) { result in
            DispatchQueue.main.async { completionHandler(result) }
        }
    }
    
    private func createRequest(for url: URL, method: HttpMethod) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        switch method {
        case .get: ()
        case .post(let body):
            request.httpBody = try! encoder.encode(body)
        }
        return request
    }
    
    private func execute<R: Decodable>(request: URLRequest, completionHandler: @escaping (Result<R, HttpClientError>) -> ()) {
        URLSession.shared.dataTask(with: request) { [self] json, response, error in
            guard let data = json else {
                completionHandler(.failure(.requestFailed))
                return
            }
            if let result = try? decoder.decode(R.self, from: data) {
                completionHandler(.success(result))
            } else {
                completionHandler(.failure(.parsingFailed))
            }
        }.resume()
    }
    
}
