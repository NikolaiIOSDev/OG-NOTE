//
//  DetailedBuilder.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit

class DetailedBuilder{
    class func buildDetailedModule()->DetailedViewController{
        let interactor = DetailedInteractor()
        let router = DetailedRouter()
        let presenter = DetailedPresenter(router: router, interactor: interactor)

        let storyboard = UIStoryboard(name: "DetailedView", bundle: nil)
        let detailedVC = storyboard.instantiateInitialViewController() as! DetailedViewController 
        detailedVC.presenter = presenter
        interactor.presenter = presenter
        router.view = detailedVC
        presenter.view = detailedVC
        
        return detailedVC
    }
}
