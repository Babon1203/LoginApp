//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Кирилл Саталкин on 07.10.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    @IBOutlet weak var labelWelcome: UILabel!
    
    var userName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userName = userName {
            labelWelcome.text = "Welcome, \(userName)!"
            
        }
        
    }
}
