//
//  NetworkService.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation

struct NetworkService {
    private let kCharacterListEndPointUrl = "https://cdn.churchofjesuschrist.org/mobile/interview/directory"

    func getCharacterList(completion: @escaping (_ result: Result<[Int], Error>) -> Void) {
        request(with: kCharacterListEndPointUrl, objectType: [Int].self, completion: completion)
    }

    private func request<Element: Decodable>(with urlString: String, objectType: Element.Type,
                                             completion: @escaping (Result<Element, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(Result.failure(NetworkServiceError.badURL(urlString)))
        }

        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(Result.failure(NetworkServiceError.networkError(error!)))
            }

            guard let responseData = data else {
                completion(Result.failure(NetworkServiceError.dataNotFound))
            }

            do {
                let element = try JSONDecoder().decode(objectType.self, from: responseData)
                completion(Result.success(element))
            } catch let error {
                completion(Result.failure(NetworkServiceError.jsonParsingError(error)))
            }
        }
        task.resume()
    }
}
