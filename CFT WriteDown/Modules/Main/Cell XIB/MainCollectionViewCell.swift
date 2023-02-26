//
//  MainCollectionViewCell.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 21.02.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet var editButton: UIButton!
    @IBOutlet var removeButton: UIButton!
    @IBOutlet var noteLabel: UILabel!
    
    @IBOutlet var detailedButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingUI()

    }
    
    private func settingUI(){
        editButton.backgroundColor = UIColor(named:ColorConstant.MainModule.colorButtons)
        editButton.tintColor = UIColor(named: ColorConstant.MainModule.colorButtonTintMain)
        editButton.layer.cornerRadius = 5
        
        removeButton.backgroundColor = UIColor(named:ColorConstant.MainModule.colorButtons)
        removeButton.tintColor = UIColor(named: ColorConstant.MainModule.colorButtonTintMain)
        removeButton.layer.cornerRadius = 5
        
        detailedButton.backgroundColor = UIColor(named:ColorConstant.MainModule.colorButtons)
        detailedButton.tintColor = UIColor(named: ColorConstant.MainModule.colorButtonTintMain)
        detailedButton.layer.cornerRadius = 5
        
        
        noteLabel.textColor = UIColor(named: ColorConstant.MainModule.colorLabelMain)
        
        backgroundColor = UIColor(named: ColorConstant.MainModule.colorBackgroundCellMain)
        
        
        editButton.setTitle("Редактировать", for: .normal)
        removeButton.setTitle("Удалить", for: .normal)
        detailedButton.setTitle("Подробная информация заметки", for: .normal)
        
        layer.cornerRadius = 20
        
    }

    @IBAction func editNote(_ sender: UIButton) {
        print("add")
    }
    
    @IBAction func removeNote(_ sender: UIButton) {
        print("remove")
    }
    
    @IBAction func detailedNote(_ sender: UIButton) {
        print("open detailed")
    }
    
}
