//
//  LoginFactory.swift
//  wolcare
//
//  Created by Mohamed dennoun on 07/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import Foundation

class LoginFactory: CustomStringConvertible {
     
        
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
        
    var description: String {
        return "{ Mail: \(self.email ), Password: \(self.password) }"
    }
    
    
    static func userFrom(dictionary: [String: Any]) -> User? {
           guard let email = dictionary["email"] as? String,
                 let password = dictionary["password"] as? String,
                 let pseudo = dictionary["pseudo"] as? String,
                 let type = dictionary["type"] as? String,
                 let firstname = dictionary["firstname"] as? String,
                 let lastname = dictionary["lastname"] as? String,
                 let birthdate = dictionary["birthdate"] as? Date,
                 let sex = dictionary["sex"] as? Bool,
                 let photo = dictionary["photo"] as? String,
                 let requestIssued = dictionary["requestIssued"] as? Int,
                 let requestFulfilled = dictionary["requestFulfilled"] as? Int
           else {
                   return nil
           }
        let user = User(_id: nil, email: email, password: password, type: type, pseudo: pseudo, firstname: firstname, lastname:lastname,
               birthdate: birthdate, sex: sex, photo: photo, requestIssued: requestIssued, requestFulfilled: requestFulfilled)
           return user
       }
       
       static func dictionaryFrom(user: User) -> [String: Any] {
           return [
               "type": "IOS",
               //"email": user.email,
               //"password": user.password,
               "password": "test1",
               "email":"test1@test.fr"
           ]
       }
    
}
