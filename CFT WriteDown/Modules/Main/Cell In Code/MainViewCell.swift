//
//  MainViewCell.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 21.02.2023.
//

import UIKit

protocol MainViewCellDelegate {
    func tappedDetailed(from cell:UICollectionViewCell)
    func tappedEdit(from cell:UICollectionViewCell)
    func tappedRemove(from cell:UICollectionViewCell)
}



class MainViewCell:UICollectionViewCell {
    
    var delegate:MainViewCellDelegate?
    
     
    @objc func tappedDetailed(){
        delegate?.tappedDetailed(from: self)
    }
    
    @objc func tappedEdit(){
        delegate?.tappedEdit(from: self)
    }
    
    @objc func tappedRemove(){
        delegate?.tappedRemove(from: self)
    }
    

    
    
    
    
    
    func configurationDetailedButtonTarget(){
        detailedButton.addTarget(self, action: #selector(tappedDetailed), for: .touchUpInside)
    }
    
    func configurationEditButtonTarget(){
        editButton.addTarget(self, action: #selector(tappedEdit), for: .touchUpInside)
    }
    
    func configurationRemoveButtonTarget(){
        removeButton.addTarget(self, action: #selector(tappedRemove), for: .touchUpInside)
    }
    
    
    
    //MARK: - Created UI elements
    
     var noteLabel:UILabel = {
       let label = UILabel()
        label.textColor = UIColor(named: ColorConstant.MainModule.colorLabelMain)
         label.font = UIFont(name: FontsConstant.fontsNote, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 20
        return label
    }()
    
     var editButton: UIButton = {
        let button = UIButton(type: .system)
         button.setImage(UIImage(systemName: "pencil.slash"), for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false

        button.tintColor = UIColor(named: ColorConstant.MainModule.colorButtons)
         
        return button
    }()
    
     var removeButton: UIButton = {
        let button = UIButton(type: .system)
         button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(named: ColorConstant.MainModule.colorButtons)
        return button
    }()
    
    
    
    var  detailedButton:UIButton = {
        let button = UIButton(type: .system)

        button.layer.cornerRadius = 5
        button.setImage(UIImage(systemName: "newspaper"), for: .normal)
        button.tintColor = UIColor(named: ColorConstant.MainModule.colorButtons)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
              
    
   lazy var stackViewY:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(editButton)
        stackView.addArrangedSubview(detailedButton)
        stackView.addArrangedSubview(removeButton)
       
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.distribution = .fill
       
       
        return stackView
    }()
    

    
  
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingsCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Cell setting method

extension MainViewCell{
    
    private func settingsCell(){
        contentView.addSubview(stackViewY)
        contentView.addSubview(noteLabel)
        backgroundColor = UIColor(named: ColorConstant.MainModule.colorBackgroundCellMain)
        layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            
            editButton.widthAnchor.constraint(equalToConstant: 90),
            removeButton.widthAnchor.constraint(equalToConstant: 90),
            detailedButton.widthAnchor.constraint(equalToConstant: 90),
            
            stackViewY.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            stackViewY.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackViewY.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackViewY.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
//            noteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            noteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            noteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            noteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            noteLabel.heightAnchor.constraint(equalToConstant: 120),
    
        ])
                
    }
    
}
