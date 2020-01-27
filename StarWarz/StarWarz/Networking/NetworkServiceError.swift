//
//  NetworkServiceError.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation

enum NetworkServiceError: LocalizedError {
    case networkError(Error)
    case badURL(String)
    case dataNotFound
    case jsonParsingError(Error)
    case invalideStatusCode(Int)

    var errorDescription: String? {
        switch self {
        case .networkError(let error):
            return NSLocalizedString("Network Error: \(error.localizedDescription)", comment: "")
        case .badURL(let url):
            return NSLocalizedString("Bad URL: \(url)", comment: "")
        case .dataNotFound:
            return NSLocalizedString("No data returned!", comment: "")
        case .jsonParsingError(let error):
            return NSLocalizedString("We had a decoding error: \(error.localizedDescription)", comment: "")
        case .invalideStatusCode(let code):
            return NSLocalizedString("Invalide status code: \(code) was returned", comment: "")
        }
    }
}
