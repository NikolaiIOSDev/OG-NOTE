//
//  DetailedViewController.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit
import CoreData



class DetailedViewController: UIViewController {
   
    var context = CoreDataProject.shared.persistentContainer.viewContext
    var note:Note?
    
    var presenter:DetailedPresenterProtocol!
    
    var imageName:String = String()
    var imagePath:URL = URL(fileURLWithPath: "")
    
    @IBOutlet var removePhoto: UIButton!
    var imageScreen:Data = Data()
    
    func getImage() {
        imageName = imagePath.absoluteString
        
        print(imageName)
    }
    
    
    @IBOutlet var backButton: UIButton!
    

    
    @IBOutlet var largeTitleNote: UILabel!
    @IBOutlet var titleNote: UITextView!
    @IBOutlet var imageNote: UIImageView!
    
    
    @IBOutlet var setupPhotoButton: UIButton!
    
    private let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
        
//        loadNote()
        
        settingUIElements()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        
        cancelKeyboard()
        
        presenter.didLoad()
        
    }
   
//    func loadNote(){
//        DispatchQueue.main.async {
//            self.titleNote.text = self.note?.text
//
//
//            if let image = self.note?.imageNote {
//                self.imageNote.image = UIImage(data: image)
//            }
//
//        }
//    }
    

    
    
    
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
    
    func save(){
        do{
          try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func cancelKeyboard(){
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = true
        view.addGestureRecognizer(tapScreen)
        
    }
    @objc func dismissKeyboard () {
        view.endEditing(true)
        note?.text = titleNote.text
        save()
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        note?.text = titleNote.text
        save()
    }
    
    @IBAction func setupPhoto(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    
    
    @IBAction func removePhotoAction(_ sender: UIButton) {
        note?.imageNote = nil
        imageNote = nil
        save()
        removePhoto.isHidden = true
    }
    
}


extension DetailedViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{

   //MARK: - Image Manipulation
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageNote.image = image
            imageName = UUID().uuidString
            imagePath = getDocumentsURL().appendingPathExtension(imageName)
            
            
            if let jpegData = image.jpegData(compressionQuality: 0.8){
                try? jpegData.write(to: imagePath)
                note?.imageNote = jpegData
                save()
                
            }
            
            
        }
        imagePicker.dismiss(animated: true)
    }
    
    func getDocumentsURL()->URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}

//MARK: - Implementation Protocol

extension DetailedViewController:DetailedViewControllerProtocol{
    func showNote(note: Note) {
        titleNote.text = note.text
        if let image = self.note?.imageNote {
            self.imageNote.image = UIImage(data: image)
        }
    }
    
    
}


