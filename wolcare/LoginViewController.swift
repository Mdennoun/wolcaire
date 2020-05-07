//
//  LoginViewController.swift
//  wolcare
//
//  Created by Mohamed dennoun on 07/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mail: UITextField!
    @IBOutlet var password: UITextField!
    
    
    let loginService: LoginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mail.delegate = self
        self.mail.tag = 1
        self.password.delegate = self
        self.password.tag = 2

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
            } else {
                // Not found, so remove keyboard.
                textField.resignFirstResponder()
            }
            
            
            return false
    }
    
    @IBAction func login(_ sender: Any) {
        
        print("mail: \(mail.text), password: \(password.text)")
        
        let user = User(email: mail.text ?? "test1@test.fr", password: password.text ?? "test2")
        self.loginService.login(user: user) { (success) in
            //print("\(success)")
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
        }
    }
    
   

}
