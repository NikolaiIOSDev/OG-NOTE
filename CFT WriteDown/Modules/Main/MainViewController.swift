//
//  MainViewController.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 20.02.2023.
//

import UIKit
import CoreData



class MainViewController: UIViewController, UINavigationControllerDelegate {
          
    var presenter:MainPresenterProtocols!
    
    var context = CoreDataManager.shared.persistentContainer.viewContext
    var notes:[Note] = [Note]()
    
    
    private var mainCollectionView:UICollectionView!
    private var barButton:UIBarButtonItem!
    private var leftBarButton:UIBarButtonItem!


    override func viewDidLoad() {
        super.viewDidLoad()
        settingsBarButton()
        settingsCollection()
        activateConstraint()
        title = "OG NOTE"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItems = [barButton]
        navigationItem.leftBarButtonItems = [leftBarButton]
        
   
        settingsBarButton()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainCollectionView.reloadData()
    }
    
 
    
    //MARK: - Settings Bar Button
    
    private func settingsBarButton(){
//        "cursorarrow.rays"
        barButton = UIBarButtonItem(image: UIImage(systemName: "figure.mixed.cardio"), style: .done, target: self, action: #selector(addNote))
        barButton.tintColor = UIColor(named: ColorConstant.MainModule.colorButtons)
        
//        figure.mixed.cardio
        leftBarButton = UIBarButtonItem(image: UIImage(systemName: "figure.baseball"), style: .done, target: self, action: #selector(removeAllNote))
        leftBarButton.tintColor = UIColor(named: ColorConstant.MainModule.colorButtons)
    }
    
    @objc private func removeAllNote() {
        for note in notes {
            context.delete(note)
            
        }
        notes = []
        save()
        mainCollectionView.reloadData()
        
    }
//
    
    @objc private func addNote(){
        var textField = UITextField()
        let allert = UIAlertController(title: "Новая заметка 😉", message: "Запиши-запиши", preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "В копилку", style: .default) {[weak self] action in
            guard let self = self else{return}
            let newNote = Note(context: self.context)
            newNote.text = textField.text
            self.save()
            self.notes.append(newNote)
            self.mainCollectionView.reloadData()
            print("add")

            }
        let allertCancelAction = UIAlertAction(title: "Перехотелось", style: .destructive)
        allert.addTextField { tf in
            tf.placeholder = "Помыть кота? Купить гараж?"
            tf.returnKeyType = .done
            tf.enablesReturnKeyAutomatically = true
            textField = tf
        }
        allert.addAction(allertAction)
        allert.addAction(allertCancelAction)
        present(allert, animated: true)
        
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
        }
    }
        
    
    func save(){
        do{
          try  context.save()

        } catch {
            print(error.localizedDescription)
        }

        
    }
    
//    func loadNote(){
//         let request = NSFetchRequest<Note>(entityName: "Note")
//
//        do{
//            let objects = try context.fetch(request)
//            notes = objects
//        } catch {
//            print(error.localizedDescription)
//        }
//
//    }
    
    
    
    
    //MARK: - Settings UICollectionView
    private func settingsCollection(){
        let mainCollectionViewLayot = UICollectionViewFlowLayout()
        
        mainCollectionViewLayot.scrollDirection = .vertical
        
        
        mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: mainCollectionViewLayot)
        
//      (XIB)  mainCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellConstant.MainModule.idCell)
        mainCollectionView.register(MainViewCell.self, forCellWithReuseIdentifier: CellConstant.MainModule.idCell)
        
        view.addSubview(mainCollectionView)

        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        mainCollectionView.showsVerticalScrollIndicator = false
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        mainCollectionView.backgroundColor = UIColor(named: ColorConstant.MainModule.colorBackgroundMain)
    }

    
    //MARK: - Method that activates the constraints
    private func activateConstraint(){
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
    //MARK: - Implementation methods Data Source, Delegate

extension MainViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstant.MainModule.idCell, for: indexPath) as! MainViewCell
        
//        let storyboard = UIStoryboard(name: "Detailed", bundle: nil)
//        if let detailedVC = storyboard.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController{
//            detailedVC.transferClosure = { txt in
//                cell.noteLabel.text = txt
//            }
//        }
        
                
        cell.delegate  = self
        cell.noteLabel.text = notes[indexPath.row].text
        cell.configurationEditButtonTarget()
        cell.configurationRemoveButtonTarget()
        cell.configurationDetailedButtonTarget()
             
        return cell
    }
    
    
    // Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 390, height: 160)
    }
    
    
    
  
}

//MARK: - Implemetation MainViewCellDelegate

extension MainViewController:MainViewCellDelegate{
    
    

    
    func tappedEdit(from cell: UICollectionViewCell) {
        guard let indexPath = mainCollectionView.indexPath(for: cell) else {return}
        let row = indexPath.row
        
        var textField = UITextField()
        let allert = UIAlertController(title: "С чего бы так ? 🧐", message: "Не стесняйся", preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "Редактировать", style: .default) {[weak self] action in
            
            guard let self = self else {return}
            self.notes[row].text = textField.text
            self.save()
            DispatchQueue.main.async {
                self.mainCollectionView.reloadData()
            }
        }
        let allertCancelAction = UIAlertAction(title: "Перехотелось", style: .destructive)
        
        allert.addAction(allertAction)
        allert.addAction(allertCancelAction)
        
        allert.addTextField() { [weak self] tf in
            guard let self = self else {return}
            
            
            let txt = self.notes[row].text
            tf.text = txt
            
            textField = tf
            //
        }
        
        
        present(allert, animated: true)
        
        
        
    }
    
    func tappedRemove(from cell: UICollectionViewCell) {
        guard let indexPath = mainCollectionView.indexPath(for: cell) else {return}
        let row = indexPath.row
        let object = notes[row]
        context.delete(object)
        notes.remove(at:row)
        save()
        DispatchQueue.main.async {
            self.mainCollectionView.reloadData()
            
        }
        
    }
    
    
    func tappedDetailed(from cell: UICollectionViewCell) {
        guard let indexPath = mainCollectionView.indexPath(for: cell) else {return}
        let row = indexPath.row

        
        let storyboardDetailed = UIStoryboard(name: "Detailed", bundle: nil)
        
        if let detailedVC = storyboardDetailed.instantiateViewController(withIdentifier: "Detailed") as? DetailedViewController  {
            detailedVC.note = self.notes[row]
            
            detailedVC.modalPresentationStyle = .fullScreen
            present(detailedVC, animated: true)

            
        }
        
        
        
        
    }

}


    //MARK: - Implementation MainViewProtocols

extension MainViewController:MainViewProtocols{
    func showNote(note: [Note]) {
        
    }
    
    
}
