//
//  MainProtocols.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation

protocol MainViewProtocols:AnyObject{
    
}

protocol MainInteractorProtocols:AnyObject{
    func getNote()
    func saveNote()

}

protocol MainPresenterProtocols:AnyObject{
    func didLoad()
}

protocol MainRouterProtocols:AnyObject{
    
}
