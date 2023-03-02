//
//  DetailedProtocols.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import Foundation
import UIKit

protocol DetailedViewControllerProtocol:AnyObject{
    func showNote(note:Note)
}

protocol DetailedInteractorProtocol:AnyObject{
    var note:Note {get set}
    var imageName:String {get set}
    var imagePath:URL {get set}
    
    func getNote()
    func getDocumentsURL()->URL
    
    func saveNote()
    }


protocol DetailedPresenterProtocol:AnyObject {
        
    func didLoad()
    func loadNote(note:Note)
    func isHiddenButton(_ button:UIButton)
    
    func didTapSetupPhotoButton(image imageNote: UIImageView, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) 
    func  didTapBackButton(titleNote text:UITextView)
    func didTapRemovePhotoButton(imageNote image:UIImageView)
    
}

protocol DetailedRouterProtocol:AnyObject {
    //No Transitions
}
