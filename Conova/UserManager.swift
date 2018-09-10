//
//  UserManager.swift
//  Conova
//
//  Created by Kevin Bunarjo on 9/9/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import Foundation
// USE ALAMOFIRE

class UserManager {
    
    func updateUserName(newName: String, completion: (Bool)->Void) {
        
    }
    
    func login(email: String, password: String, completion: (User?, UserLoginError?)->Void) {
        
    }
    
}

class User {
    var name: String
    var email: String
    var description: String
}

enum UserLoginError {
    case invalidEmail
    case invalidPassword
    case noNetworkConnection
}
