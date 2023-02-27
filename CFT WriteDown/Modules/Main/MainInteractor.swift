//
//  MainInteractor.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation
import CoreData

class MainInteractor{
    weak var presenter:MainPresenterProtocols!
    var context = CoreDataManager.shared.persistentContainer.viewContext
            
}


//MARK: - Implementation MainInteractorProtocol

extension MainInteractor:MainInteractorProtocols{
    
    
    func getNote() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do{
        let objects = try context.fetch(request)
        notes = objects
            } catch {
        print(error.localizedDescription)
            }
            
        }
        
    
    func saveNote() {
        do{
           try context.save()
        } catch {
            print("Ошибка при сохранении данных")
        }
    }
    
    
    
    
    
    
    
}
    

