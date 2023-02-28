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
    func getNote()->Note
    func getDocumentsURL()->URL
    
    func saveNote()
    }


protocol DetailedPresenterProtocol:AnyObject {
    func didLoad()
    func loadNote(note:Note)
    
    func didTapSetupPhotoButton(entity note: inout Note?, image imageNote: UIImageView, imageName:inout String, imagePath path:inout URL,  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    
    func  didTapBackButton(entity note:inout Note?, titleNote text:UITextView)
    

    
    func didTapRemovePhotoButton(entity note:inout Note?, imageNote image:UIImageView)
    
    
    
    
    
    
}

protocol DetailedRouterProtocol:AnyObject {
    //No Transitions
}
