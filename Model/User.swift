//
//  Login.swift
//  wolcare
//
//  Created by Mohamed dennoun on 07/05/2020.
//  Copyright © 2020 Mohamed dennoun. All rights reserved.
//

import Foundation

class User: CustomStringConvertible {
 
    
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var description: String {
        return "{ Mail: \(self.email ), Password: \(self.password) }"
    }
}
