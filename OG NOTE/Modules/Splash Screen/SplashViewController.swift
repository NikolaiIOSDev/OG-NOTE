//
//  SplashViewController.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 20.02.2023.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet var logoLabel:UILabel!
    
    @IBOutlet var constraintLogo: NSLayoutConstraint!
    
    @IBOutlet var constraintLogoBottom: NSLayoutConstraint!
    
    
    private var timer = Timer()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animations()
        settinglabel()
        view.backgroundColor = UIColor(named: ColorConstant.SplashModule.colorBackgroundSplash)

    }
    
    //MARK: - Setting for Label
    private func settinglabel(){
        logoLabel.font = UIFont(name: FontsConstant.fonts, size: 50)
        logoLabel.text = "OG NOTE"
        logoLabel.textColor = UIColor(named: ColorConstant.SplashModule.colorLabelSplash)
    }
    
    
    //MARK: - Animations for Label
    private func animations(){
        constraintLogo.constant = 0
        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.0,
                       options: [.curveLinear], animations:
                        {
            self.view.layoutIfNeeded()
        })
        timer=Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(animationsBottom), userInfo: nil, repeats: false)
        
        
        timer = Timer.scheduledTimer(timeInterval: 2.6, target: self, selector: #selector(goToMain), userInfo: nil, repeats: false)
    }
    
    @objc private func animationsBottom(){
        constraintLogoBottom.constant = -1000
        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.0,
                       options: [.curveLinear]) {
            self.view.layoutIfNeeded()
            
        }
        
        
    }
    
    //MARK: - Transition Method
    @objc private func goToMain(){
        
        let mainVC = MainBuilder.buildMainModule()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
}

