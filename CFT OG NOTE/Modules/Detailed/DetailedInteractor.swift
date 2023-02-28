//
//  DetailedInteractor.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation

class DetailedInteractor{
    weak var presenter:DetailedPresenterProtocol!
    var context = CoreDataManager.shared.persistentContainer.viewContext
    var note:Note
    
    init(note: Note) {
        self.note = note
    }
    
    
}

extension DetailedInteractor:DetailedInteractorProtocol{
     func getNote()->Note{
        presenter.loadNote(note: note)
        return note
    }
    
    func saveNote(){
        do{
            try context.save()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func getDocumentsURL()->URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
