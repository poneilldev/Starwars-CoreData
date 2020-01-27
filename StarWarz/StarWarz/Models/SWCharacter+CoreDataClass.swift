//
//  SWCharacter+CoreDataClass.swift
//  
//
//  Created by Paul O'Neill on 1/26/20.
//
//

import Foundation
import CoreData

@objc(SWCharacter)
public class SWCharacter: NSManagedObject, Codable {
    @NSManaged var id: Int32
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var birthdate: String
    @NSManaged var profilePicture: String
    @NSManaged var forceSensitive: Bool
    @NSManaged var affiliation: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case birthdate
        case profilePicture
        case forceSensitive
        case affiliation
    }

    required convenience public init(from decoder: Decoder) throws {
        // Create NSEntityDescription with NSManagedObjectContext
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext,
        let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext else {
            throw NetworkServiceError.badURL("dude")
        }

        guard let entity = NSEntityDescription.entity(forEntityName: "SWCharacter", in: managedObjectContext) else {
            throw NetworkServiceError.dataNotFound
        }

        self.init(entity: entity, insertInto: nil)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int32.self, forKey: .id)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        birthdate = try values.decode(String.self, forKey: .birthdate)
        profilePicture = try values.decode(String.self, forKey: .profilePicture)
        forceSensitive = try values.decode(Bool.self, forKey: .forceSensitive)
        affiliation = try values.decode(String.self, forKey: .affiliation)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(birthdate, forKey: .birthdate)
        try container.encode(profilePicture, forKey: .profilePicture)
        try container.encode(forceSensitive, forKey: .forceSensitive)
        try container.encode(affiliation, forKey: .affiliation)
    }

}
