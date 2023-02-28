//
//  DetailedViewController.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit
import CoreData



class DetailedViewController: UIViewController {
    
    //MARK: - Properties
   
    var context = CoreDataManager.shared.persistentContainer.viewContext
    
    var presenter:DetailedPresenterProtocol!
    
   

    
    @IBOutlet var removePhoto: UIButton!
    @IBOutlet var backButton: UIButton!
    

    
    @IBOutlet var largeTitleNote: UILabel!
    @IBOutlet var titleNote: UITextView!
    @IBOutlet var imageNote: UIImageView!
    
    
    @IBOutlet var setupPhotoButton: UIButton!
    
    private let imagePicker = UIImagePickerController()
    
    //MARK: - Life Cycle Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        settingUIElements()
        presenter.didLoad()
                        
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        cancelKeyboard()
        
        presenter.didLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.removeButtonHidden(removePhoto)
    }
   
    
    //MARK: - Settings UI

    func settingUIElements(){

       
        titleNote.font = UIFont(name: FontsConstant.fontsNote, size: 15)
        
        titleNote.layer.cornerRadius = 15
        
        
        largeTitleNote.font = UIFont(name: FontsConstant.fonts, size: 30)
        largeTitleNote.text = "OG NOTE"
        largeTitleNote.textColor = UIColor(named: ColorConstant.DetailedModule.colorLargeTitleNote)
        
        setupPhotoButton.layer.cornerRadius = 8
        setupPhotoButton.backgroundColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsDetailed)
        setupPhotoButton.tintColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsTint)
        
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsDetailed)
        backButton.tintColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsTint)
        
        removePhoto.layer.cornerRadius = 8
        removePhoto.backgroundColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsDetailed)
        removePhoto.tintColor = UIColor(named: ColorConstant.DetailedModule.colorButtonsTint)
        
        imageNote.layer.cornerRadius = 15
        
        
    }
    
    //MARK: - Image in Full Size
    
    func 
    
    
    //MARK: - Actions Methods
    
    func cancelKeyboard(){
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = true
        view.addGestureRecognizer(tapScreen)
        
    }
    @objc func dismissKeyboard () {
        view.endEditing(true)
        presenter.didTapBackButton(titleNote: titleNote)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        presenter.didTapBackButton(titleNote: titleNote)
    }
    
    @IBAction func setupPhoto(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    
    
    @IBAction func removePhotoAction(_ sender: UIButton) {
        presenter.didTapRemovePhotoButton(imageNote: imageNote)
        removePhoto.isHidden = true
    }
    
}

//MARK: - Image Manipulation

extension DetailedViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        presenter.didTapSetupPhotoButton(image: imageNote, didFinishPickingMediaWithInfo: info)
        
        imagePicker.dismiss(animated: true)
        
    }
}

//MARK: - Implementation DetailedViewControllerProtocol

extension DetailedViewController:DetailedViewControllerProtocol{
    func showNote(note: Note) {
        DispatchQueue.main.async {
            
            self.titleNote.text = note.text
            if let image = note.imageNote {
                self.imageNote.image = UIImage(data: image)
                
            }
        }
    }
}


