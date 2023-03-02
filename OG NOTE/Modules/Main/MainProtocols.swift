//
//  MainProtocols.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 20.02.2023.
//

import Foundation
import UIKit
import CoreData

protocol MainViewProtocols:AnyObject{
    func showNote(notes:[Note])
}

protocol MainInteractorProtocols:AnyObject{
    var context: NSManagedObjectContext {get set}
    
    func getNote()
    func saveNote()

}

protocol MainPresenterProtocols:AnyObject{
    func didLoad()
    func loadNote(entity notes:[Note])
    func informationalNote(entity notes: inout [Note])
    
    func didTapRemoveNotesLeftButton(entity notes: inout [Note], collection collectionView:UICollectionView)
    
    func didTapAddNoteRightButton(entity notes: inout [Note], collecton collectionView:UICollectionView, tf textField:UITextField)
    
    
    func didTapEditButton(entity notes: inout [Note], collection collectionView: UICollectionView, cell:UICollectionViewCell, tf textField:UITextField)
    func didTapDetailedButton(entity notes:[Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell)
    func didTapRemoveButton(entity notes: inout [Note], collection collectionView: UICollectionView, for cell: UICollectionViewCell)
    
    
}

protocol MainRouterProtocols:AnyObject{
    func presentDetailedModule(for data:Note?)
}
