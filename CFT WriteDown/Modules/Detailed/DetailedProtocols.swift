//
//  DetailedProtocols.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation

protocol DetailedViewControllerProtocol:AnyObject{
    func showNote(note:Note)
}

protocol DetailedInteractorProtocol:AnyObject{
    func getNote()->Note
}

protocol DetailedPresenterProtocol:AnyObject {
    func didLoad()
    
}

protocol DetailedRouterProtocol:AnyObject {
    
}
