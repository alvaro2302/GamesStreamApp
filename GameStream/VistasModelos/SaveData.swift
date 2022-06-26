//
//  SaveData.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 12/6/22.
//

import Foundation
class SaveData{
    var email:String = ""
    var password:String = ""
    var name:String = ""
    
    func saveData(email:String,password:String, name:String) ->Bool{
        print("in function save data get \(email) + \(password) + \(name)")
        UserDefaults.standard.set([email,password,name],forKey: "datosUsuario")
        return true
    }
    func getData() -> [String]{
        let datesUser:[String] = UserDefaults.standard.stringArray(forKey:"datosUsuario")!
        print("function get Data \(datesUser)")
        return datesUser
    }
    func validateData(email:String,password:String) -> Bool{
        var emailSaved = ""
        var passwordSaved = ""
        print("Review  dates defaults in the email  \(emailSaved) and password  \(passwordSaved)")
        if UserDefaults.standard.object(forKey:"datosUsuario") != nil {
            emailSaved = UserDefaults.standard.stringArray(forKey:"datosUsuario")![0]
            passwordSaved = UserDefaults.standard.stringArray(forKey:"datosUsuario")![1]
            print("data is \(emailSaved)  and password is  \(passwordSaved)")
            
            return (email == emailSaved && password == passwordSaved)
           
            
        }
        else
        {
            print("not data")
            return false
        }
        
    }
}
