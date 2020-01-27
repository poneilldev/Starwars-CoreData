//
//  CharacterManager.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation
import CoreData

struct CharacterManager {
    let service = NetworkService()
    let cdManager = CoreDataManager()

    func getCharacterList(completion: @escaping (Result<StarWarzCharacters, Error>) -> Void) {
        service.getCharacterList(completion: completion)
        cdManager.saveContext()        
    }
}
