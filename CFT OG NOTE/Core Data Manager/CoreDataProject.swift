//
//  CoreDataManager.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation
import CoreData

class CoreDataProject {
    static let shared = CoreDataProject()
    
    lazy var persistentContainer:NSPersistentContainer={
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { store, error in
            if let error = error as NSError?{
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext(){
        do {
            try context.save()
        } catch{
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
