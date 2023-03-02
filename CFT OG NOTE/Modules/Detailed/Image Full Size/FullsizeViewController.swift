//
//  FullsizeViewController.swift
//  CFT OG NOTE
//
//  Created by Николай Федоров on 28.02.2023.
//

import UIKit

class FullsizeViewController: UIViewController {
    @IBOutlet var fullSizeImageNote: UIImageView!
    var forImageView = UIImage(systemName: "")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fullSizeImageNote.image = forImageView
    }
}
