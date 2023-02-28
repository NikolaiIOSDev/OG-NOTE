//
//  DetailedInteractor.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation

class DetailedInteractor{
    weak var presenter:DetailedPresenterProtocol!
    
    var note:Note
    
    init(note: Note) {
        self.note = note
    }
    
    
}

extension DetailedInteractor:DetailedInteractorProtocol{
    func getNote()->Note{
        return note
    }
    
}
