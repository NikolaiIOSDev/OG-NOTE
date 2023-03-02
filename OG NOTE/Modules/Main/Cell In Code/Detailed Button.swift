//
//  Detailed Button.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 23.02.2023.
//

import UIKit

class DetailedButton:UIButton{
    
    override init(frame: CGRect) {
    super.init(frame: frame)
//    setting()
}

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func setting(){
//        addTarget(self, action: #selector(transitionDetailed), for: .touchUpInside)
//    }
//
//    func topMostController() -> UIViewController {
//        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
//            while (topController.presentedViewController != nil) {
//                topController = topController.presentedViewController!
//            }
//            return topController
//        }
    
    
//    @objc func transitionDetailed(){
//        let storyboardMain = UIStoryboard(name: "MainView", bundle: nil)
//        let storyboardDetailed = UIStoryboard(name: "Detailed", bundle: nil)
//
//        guard let mainVC = storyboardMain.instantiateViewController(withIdentifier: "MainView") as? MainViewController else {return}
//        guard let detailedVC = storyboardDetailed.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController else {return}
//        detailedVC.modalPresentationStyle = .formSheet
//        let topVC = topMostController()
//        topVC.present(detailedVC, animated: true)
//        print("Hi")
       
}
    

//MARK: - SNIPPET
//перебросить через конфиг адд таргет и воспользоваться им в другом контроллере!
