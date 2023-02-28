//
//  DetailedPresenter.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit

class DetailedPresenter{
    weak var view:DetailedViewControllerProtocol!
    var router:DetailedRouterProtocol
    var interactor:DetailedInteractorProtocol
    
    init(router: DetailedRouterProtocol, interactor: DetailedInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

//MARK: - Implementation DetailedPresenterProtocol

extension DetailedPresenter:DetailedPresenterProtocol{
    
    // Datas interaction

    func didLoad(){
    interactor.getNote()
    }
    
    func loadNote(note:Note){
        self.view.showNote(note: note)
    }
    
    
    // Work with Picker
     func didTapSetupPhotoButton(image imageNote: UIImageView, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            if let image = info[.originalImage] as? UIImage {
                imageNote.image = image
                interactor.imageName = UUID().uuidString
                interactor.imagePath = interactor.getDocumentsURL().appendingPathExtension(interactor.imageName)
                print(interactor.imagePath.absoluteString)
                
                if let jpegData = image.jpegData(compressionQuality: 0.8){
                    try?
                    jpegData.write(to: interactor.imagePath, options: .completeFileProtection)
                    interactor.note.imageNote = jpegData
                    interactor.saveNote()
                    
                }
                
                
            }
        }
    
    func removeButtonHidden(_ button:UIButton){
        if interactor.note.imageNote == nil {
            button.isHidden = true
        } else {
            button.isHidden = false
        }
    }
    
    func didTapBackButton( titleNote text: UITextView) {
    
        interactor.note.text = text.text

        interactor.saveNote()

    }

    func didTapRemovePhotoButton( imageNote image:UIImageView) {
        
        interactor.note.imageNote = nil
        image.image = nil
        
        interactor.saveNote()

    }
}

    
    
    
    

