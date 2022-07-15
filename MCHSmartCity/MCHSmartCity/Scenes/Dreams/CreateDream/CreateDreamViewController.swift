//
//  CreateDreamViewController.swift
//  MCHSmartCity
//
//  Created by Nikita Nagornov on 15.07.2022.
//

import Foundation
import UIKit

class CreateDreamViewController: UIViewController {
    
    @IBOutlet var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITextField.appearance().tintColor = .white
        
        let placeholderText = NSAttributedString(string: "Я хочу...",
                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        textField?.attributedPlaceholder = placeholderText
        
        navigationController?.isNavigationBarHidden = true
    }
}
