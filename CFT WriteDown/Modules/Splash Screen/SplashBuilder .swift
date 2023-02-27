//
//  SplashBuilder .swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 27.02.2023.
//

import UIKit

class SplashBuilder{
    
class func buildMainModule()->SplashViewController {
        let storyboard = UIStoryboard(name: "MainView", bundle: nil)
        let splashVC = storyboard.instantiateViewController(withIdentifier: "Splash") as! SplashViewController
    
        return splashVC
    }
}
    

