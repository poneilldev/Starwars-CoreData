//
//  NetworkServiceError.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation

enum NetworkServiceError: Error {
    case networkError(Error)
    case badURL(String)
    case dataNotFound
    case jsonParsingError(Error)
    case invalideStatusCode(Int)
}
