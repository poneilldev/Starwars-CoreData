//
//  SWCharacter+CoreDataProperties.swift
//  
//
//  Created by Paul O'Neill on 1/26/20.
//
//

import Foundation
import CoreData


extension SWCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SWCharacter> {
        return NSFetchRequest<SWCharacter>(entityName: "SWCharacter")
    }


}
