//
//  DetailedPresenter.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation

class DetailedPresenter{
    weak var view:DetailedViewControllerProtocol!
    var router:DetailedRouterProtocol
    var interactor:DetailedInteractorProtocol
    
    init(router: DetailedRouterProtocol, interactor: DetailedInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension DetailedPresenter:DetailedPresenterProtocol{
    func didLoad(){
      let note = interactor.getNote()
        view.showNote(note: note)
    
    }
    
    
    
}
