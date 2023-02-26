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
    
}
