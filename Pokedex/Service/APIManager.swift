//
//  APIManager.swift
//  Pokedex
//
//  Created by Julien GUERIN on 24/02/2023.
//

import Foundation
import Combine

enum HTTPMethods: String {
    case get = "get"
}

class APIManager<T: Decodable> {

    struct RequestModel {
        let url: URL?
        let method: HTTPMethods
    }

    static var shared: APIManager<T> {
        return APIManager<T>()
    }

    func request(with model: RequestModel) -> AnyPublisher<T, Error> {
                guard let url = model.url else {
                   return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
                }
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = model.method.rawValue

                return URLSession.shared
                .dataTaskPublisher(for: urlRequest)
                .tryMap({ data, response in
                    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                        throw URLError(.badServerResponse)
                    }
                    return data
                })
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
}
