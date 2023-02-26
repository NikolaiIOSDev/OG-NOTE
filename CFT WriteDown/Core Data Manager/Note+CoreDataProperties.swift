//
//  Note+CoreDataProperties.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//
//

import Foundation
import CoreData
import UIKit

extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var text: String?
    @NSManaged public var image: String?

}

extension Note : Identifiable {

}
