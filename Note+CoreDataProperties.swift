//
//  Note+CoreDataProperties.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 26.02.2023.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var image: String?
    @NSManaged public var text: String?

}

extension Note : Identifiable {

}
