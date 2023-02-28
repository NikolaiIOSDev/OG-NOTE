//
//  MainBuilder.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 20.02.2023.
//
import UIKit


class MainBuilder{
    class func buildMainModule()->MainViewController {
        
        let router = MainRouter()
        let interactor = MainInteractor()
        let presenter = MainPresenter(interactor: interactor, router: router)
        
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        
        router.view = mainVC
        interactor.presenter = presenter
        presenter.view = mainVC
        mainVC.presenter = presenter
        
        
        return mainVC
        
    }
}

