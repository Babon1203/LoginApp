//
//  ViewController.swift
//  LoginApp
//
//  Created by Кирилл Саталкин on 07.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizingTextFields()
        
        
    }
    
    //осуществление входа
    var user = "User"
    var password = "Password"
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert()
            return false
        }
        return true
    }
    
    //передача имени на второй экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginViewController" {
            if let destinationViewController = segue.destination as? LoginViewController {
                destinationViewController.userName = userNameTextField.text
            }
        }
    }
    //скрытие клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //возврат на первое окно и удаление строк
    @IBAction func unwind(for sender: UIStoryboardSegue){
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // подсказки user и password
    @IBAction func showAlertPasswordAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!", message: "Your password is ~Password~ 😉", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showAlertLoginAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!", message: "Your user name is ~User~😉", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    // алерт об ошибке ввода
    private func showAlert() {
        let alert = UIAlertController(title: "Invalid login or password 🥺", message: "Please, enter correct login and password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        userNameTextField.text = ""
        passwordTextField.text = ""
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    //настройка клавиатуры
    private func customizingTextFields () {
        passwordTextField.autocorrectionType = .no
        passwordTextField.smartQuotesType = .no
        passwordTextField.isSecureTextEntry = true
        
        userNameTextField.autocorrectionType = .no
        userNameTextField.smartQuotesType = .no
    }
    
}
