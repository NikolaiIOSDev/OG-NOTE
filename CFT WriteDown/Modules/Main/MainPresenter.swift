//
//  MainPresenter.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import UIKit

class MainPresenter{
    weak var view:MainViewProtocols!
    var interactor:MainInteractorProtocols
    var router:MainRouterProtocols
    
    
    init( interactor: MainInteractorProtocols, router: MainRouterProtocols) {
        self.interactor = interactor
        self.router = router
         
    }
    
    
}


//MARK: - Implementation MainPresenterProtocol

extension MainPresenter:MainPresenterProtocols{
    
    func didTapRemoveButton() {
        
    }
    
    
    
    
    
    // Datas interaction
    func didLoad() {
        interactor.getNote()
    }
    
    func editNote(notes: [Note]) {
        
    }
    
    func removeNote(notes: [Note]) {
        
    }
    
    
    // Buttons interaction
    
    func didTapEditButton() {
        
    }
    
    
    func didTapRemoveButton(entity notes: [Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {return}
        var notesCopy = notes
        let row = indexPath.row
        let object = notesCopy[row]
        //        context.delete(object)
        notesCopy.remove(at:row)
        //        save()
        DispatchQueue.main.async {
            collectionView.reloadData()
            
        }
    }
        
    
        
        
        func didTapDetailedButton(entity notes: [Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell){
            guard let indexPath = collectionView.indexPath(for: cell) else {return}
            let row = indexPath.row
            //
            //
            let storyboardDetailed = UIStoryboard(name: "Detailed", bundle: nil)
            
            if let detailedVC = storyboardDetailed.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController  {
                let note = notes[row]
                detailedVC.note = note
                
                detailedVC.modalPresentationStyle = .fullScreen
                
                router.presentDetailedModule(for: note)
                
                
                
                
                
            }
        }
    
}

