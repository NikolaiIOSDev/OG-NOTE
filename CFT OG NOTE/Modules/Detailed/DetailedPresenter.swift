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

extension DetailedPresenter:DetailedPresenterProtocol{
    
    
    func didTapBackButton(entity note: inout Note?, titleNote text: UITextView) {
        if let note = note {
            note.text = text.text
        }
        interactor.saveNote()

    }

    func didTapRemovePhotoButton(entity note: inout Note?, imageNote image:UIImageView) {
        
        if let note = note {
            note.imageNote = nil
            image.image = nil
        }
        interactor.saveNote()

    }
    
 
    
    // Datas interaction

    func didLoad(){
    interactor.getNote()
    }
    
    func loadNote(note:Note){
        let detailedNote = interactor.getNote()
        self.view.showNote(note: detailedNote)
    }
    
    
    // Work with Picker
     func didTapSetupPhotoButton(entity note: inout Note?, image imageNote: UIImageView, imageName: inout String, imagePath path: inout URL, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         guard let note = note else {return}
        
            if let image = info[.originalImage] as? UIImage {
                imageNote.image = image
                imageName = UUID().uuidString
                path = interactor.getDocumentsURL().appendingPathExtension(imageName)
                
                
                if let jpegData = image.jpegData(compressionQuality: 0.8){
                    try? jpegData.write(to: path)
                    note.imageNote = jpegData
                    

                    
                }
                
                
            }
        }
    }

    
    
    
    

