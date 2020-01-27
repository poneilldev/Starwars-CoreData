//
//  AffiliationType.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/26/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation

enum AffiliationType: String {
    case FIRST_ORDER
    case RESISTANCE
    case SITH
    case JEDI

    var displayText: String {
        switch self {
        case .FIRST_ORDER:
            return "First Order"
        case .RESISTANCE:
            return "Resistance"
        case .SITH:
            return "Sith"
        case .JEDI:
            return "Jedi"
        }
    }
}
