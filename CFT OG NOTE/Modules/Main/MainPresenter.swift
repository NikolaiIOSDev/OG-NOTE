//
//  MainPresenter.swift
//  CFT OG NOTE
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
 
    
    // Datas interaction
    func didLoad() {
        interactor.getNote()
        
    }
    
    func loadNote(entity notes:[Note]){
        self.view.showNote(notes: notes)

        
    }

    
    // Buttons interaction
    
    
    func didTapAddNoteRightButton(entity notes: inout [Note], collecton collectionView: UICollectionView, tf textField: UITextField){
        let newNote = Note(context: interactor.context)
        newNote.text = textField.text
        interactor.saveNote()
        notes.append(newNote)
        collectionView.reloadData()
        print("add")
    }
    
    func didTapRemoveNotesLeftButton(entity notes: inout [Note], collection collectionView:UICollectionView){
        for note in notes {
        interactor.context.delete(note)
            
        }
        notes = []
        interactor.saveNote()
        collectionView.reloadData()
        
    }
    
    
    
    func didTapEditButton(entity notes: inout [Note], collection collectionView: UICollectionView, cell:UICollectionViewCell, tf textField:UITextField) {
        guard let indexPath = collectionView.indexPath(for: cell) else {return}
        let row = indexPath.row
        
        notes[row].text = textField.text
        interactor.saveNote()
        DispatchQueue.main.async {
            collectionView.reloadData()
        }
    }
    
    
    func didTapRemoveButton(entity notes: inout [Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else {return}
        let row = indexPath.row
        let object = notes[row]
        interactor.context.delete(object)
        notes.remove(at:row)
        interactor.saveNote()
        DispatchQueue.main.async {
            collectionView.reloadData()
            
        }
    }

        func didTapDetailedButton(entity notes: [Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell){
            guard let indexPath = collectionView.indexPath(for: cell) else {return}
            let row = indexPath.row
            let storyboardDetailed = UIStoryboard(name: "Detailed", bundle: nil)
            
            if let detailedVC = storyboardDetailed.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController  {
                let note = notes[row]                
                detailedVC.modalPresentationStyle = .fullScreen
                
                router.presentDetailedModule(for: note)
                
                
                
                
                
            }
        }
    
}

