//
//  CoreDataManager.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    public static let shared = CoreDataManager()

    let identifier = "com.paul.StarWarz"
    let model = "StarWarz"

    // MARK: - Core Data stack

    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension CodingUserInfoKey {
   static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}
