//
//  DetailedBuilder.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit

class DetailedBuilder{
    class func buildDetailedModule(entity  note:Note)->DetailedViewController{
        let interactor = DetailedInteractor(note: note)
        let router = DetailedRouter()
        let presenter = DetailedPresenter(router: router, interactor: interactor)

        let storyboard = UIStoryboard(name: "Detailed", bundle: nil)
        let detailedVC = storyboard.instantiateViewController(withIdentifier: "Detailed") as! DetailedViewController
            detailedVC.presenter = presenter
            interactor.presenter = presenter
            router.view = detailedVC
            presenter.view = detailedVC
            return detailedVC

        
    }
}
