//
//  MainPresenter.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation

class MainPresenter{
    weak var view:MainViewProtocols!
    var interactor:MainInteractorProtocols
    var router:MainRouterProtocols
    
    
    init( interactor: MainInteractorProtocols, router: MainRouterProtocols) {
        self.interactor = interactor
        self.router = router
    }
    
    
}


//MARK: - Implementation MainPresenterProtocol

extension MainPresenter:MainPresenterProtocols{
    
    // Datas interaction
    func didLoad() {
        interactor.getNote()
    }
    
    func editNote(notes: [Note]) {
        
    }
    
    func removeNote(notes: [Note]) {
        
    }
    
    
    // Buttons interaction
    
    func didTapEditButton() {
        
    }
    
    func didTapRemoveButton() {
        
    }
    
    func didTapDetailedButton(entity note: Note) {
        router.presentDetailedModule(for: note)
    }
    
}
