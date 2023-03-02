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
    var imageName: String = String()
    
    var imagePath: URL = URL(filePath: "")
    
    
    init(note: Note) {
        self.note = note
    }
    
    
}
//MARK: - Implementation DetailedInteractorProtocol

extension DetailedInteractor:DetailedInteractorProtocol{
   
     func getNote(){
        presenter.loadNote(note: note)
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
