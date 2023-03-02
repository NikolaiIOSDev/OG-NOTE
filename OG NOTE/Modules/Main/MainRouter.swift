//
//  MainRouter.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation

class MainRouter{
    weak var view:MainViewController!
}

//MARK: - Implementation MainRouterProtocol

extension MainRouter:MainRouterProtocols{
    func presentDetailedModule(for data: Note?) {
        guard let data = data else {return}
        let detailedVC = DetailedBuilder.buildDetailedModule(entity: data)
        detailedVC.modalPresentationStyle = .fullScreen
        view.present(detailedVC, animated: true)
        
        
    }
    
    
}
