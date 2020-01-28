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
        // clear cache
        clearCharacters()

        // ask server for updated list
        service.getCharacterList(completion: completion)
        cdManager.saveContext()        
    }

    func clearCharacters() {
        let context = cdManager.persistentContainer.viewContext
        let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SWCharacter")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        do {
            deleteRequest.resultType = .resultTypeObjectIDs
            let result = try context.execute(deleteRequest) as? NSBatchDeleteResult
            if let objectIDArray = result?.result as? [NSManagedObjectID] {
                let changes = [NSDeletedObjectsKey: objectIDArray]
                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [context])
            }
            try context.save()
        } catch let error {
            print(error)
        }
    }
}
