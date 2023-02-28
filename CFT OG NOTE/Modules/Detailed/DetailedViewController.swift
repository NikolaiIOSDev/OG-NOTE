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
    var note:Note?
    
    var presenter:DetailedPresenterProtocol!
    
    var imageName:String = String()
    var imagePath:URL = URL(fileURLWithPath: "")
    var imageScreen:Data = Data()

    
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
        presenter.didLoad()
        
        
        getImage()
        
//        loadNote()
        
        settingUIElements()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        cancelKeyboard()
        
        presenter.didLoad()
        
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
    
    //MARK: - Actions Methods
    
    func cancelKeyboard(){
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = true
        view.addGestureRecognizer(tapScreen)
        
    }
    @objc func dismissKeyboard () {
        view.endEditing(true)
        presenter.didTapBackButton(entity: &note, titleNote: titleNote)
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        presenter.didTapBackButton(entity: &note, titleNote: titleNote)
    }
    
    @IBAction func setupPhoto(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    
    
    @IBAction func removePhotoAction(_ sender: UIButton) {
        presenter.didTapRemovePhotoButton(entity: &note, imageNote: imageNote)
    }
    
}

//MARK: - Image Manipulation

extension DetailedViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        presenter.didTapSetupPhotoButton(entity: &note, image: imageNote, imageName: &imageName, imagePath: &imagePath, didFinishPickingMediaWithInfo: info)
        
        imagePicker.dismiss(animated: true)
    }
    
    func getImage() {
        imageName = imagePath.absoluteString
        
        print(imageName)
    }
    
    
}

//MARK: - Implementation Protocol

extension DetailedViewController:DetailedViewControllerProtocol{
    func showNote(note: Note) {
        self.note = note
        DispatchQueue.main.async {
            
            self.titleNote.text = self.note?.text
            if let image = self.note?.imageNote {
                self.imageNote.image = UIImage(data: image)
                
            }
        }
        
    }

    
}


