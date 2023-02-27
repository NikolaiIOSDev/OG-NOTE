//
//  MainProtocols.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation

protocol MainViewProtocols:AnyObject{
    func showNote(note:[Note])
}

protocol MainInteractorProtocols:AnyObject{
    func getNote()
    func saveNote()

}

protocol MainPresenterProtocols:AnyObject{
    func didLoad()    
    func editNote(notes:[Note])
    func removeNote(notes:[Note])
    
    func didTapEditButton()
    func didTapRemoveButton()
    func didTapDetailedButton(entity note: Note)
    
    
}

protocol MainRouterProtocols:AnyObject{
    func presentDetailedModule(for data:Note)
}
