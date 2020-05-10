//
//  SignInViewController.swift
//  wolcare
//
//  Created by Arnaud Salomon on 09/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import UIKit
//, UIPickerViewDelegate, UIPickerViewDataSource
class SignInViewController: UIViewController {
     /* func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderData[row]
    }*/
    
    
    @IBOutlet var pseudonymeTxt: UILabel!
    @IBOutlet var passwordTxt: UILabel!
    @IBOutlet var firstnameTxt: UILabel!
    @IBOutlet var nameTxt: UILabel!
    @IBOutlet var emailTxt: UILabel!
    @IBOutlet var genderTxt: UILabel!
    @IBOutlet var birthdateTxt: UILabel!
    @IBOutlet var avatarTxt: UILabel!
    
    @IBOutlet var pseudoEdt: UITextField!
    @IBOutlet var passwordEdt: UITextField!
    @IBOutlet var firstnameEdt: UITextField!
    @IBOutlet var nameEdt: UITextField!
    @IBOutlet var emailEdt: UITextField!
    
    
   /* @IBOutlet var genderPicker: UIPickerView!
    @IBAction func birthdatePicker(_ sender: Any) {
    }*/
  
    let userWebService: UserWebService = UserWebService()
    
   // var genderData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(confirm))
        
        navigationController?.title = "Inscription"
        
        //self.genderPicker.delegate = self
        //self.genderPicker.dataSource = self
        //genderData = ["un Homme", "une Femme"]
        
        
    }
    
    @objc func confirm() {
        let date = Date()
        
        guard let email = self.emailEdt.text,
              let password = self.passwordEdt.text,
              let pseudo = self.pseudoEdt.text,
              let firstname = self.firstnameEdt.text,
              let lastname = self.nameEdt.text
              //let birthdate = date?,
              //let photo = "La Pic du siecle !"
              //let sex = true,
              else {
                return
        }
        
        let user = User(_id: nil,email: email, password: password, type: "type IOS", pseudo: pseudo, firstname: firstname, lastname: lastname,
        birthdate: nil, sex: true, photo: "photo", requestIssued: 0, requestFulfilled: 0)
        
        self.userWebService.newUser(user: user) { (success) in
            print("\(success)")
        }
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
