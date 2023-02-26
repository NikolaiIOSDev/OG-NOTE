//
//  DetailedView.swift
//  CFT WriteDown
//
//  Created by Николай Федоров on 22.02.2023.
//

import UIKit

class DetailedView:UIView {
    
   
    //MARK: - Created UI elements
    let view:UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "detailed detailed detailed detailed detailed detailed detailed detailed detailed detaileddetailed detailed detailed detailed detaileddetailed detailed detailed detailed detailedvdetailed detailed detailed detailed detaileddetailed detailed detailed detailed detaileddetailed detailed detailed detailed detailedvvvdetailed detailed detailed detailed detailedvdetailed detailed detailed detailed detailed"
        label.numberOfLines = 30
        label.textColor = UIColor(named: ColorConstant.DetailedModule.colorLabel)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VIPER")
        imageView.translatesAutoresizingMaskIntoConstraints = true
        
        return imageView
    }()
    
    
    //MARK: - Init
     init() {
         super.init(frame: .zero)
           settingsElements()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

//MARK: - Setting method

extension DetailedView {
    private func settingsElements(){
        view.addSubview(label)
        view.addSubview(imageView)
        addSubview(view)
        guard let superview = superview else {return}

        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16)
            
            
        
        ])
    }
}


