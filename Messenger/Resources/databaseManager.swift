 //
//  databaseManager.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 06/11/24.
//
import Foundation
import Firebase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}
// Mark: Account managment
extension DatabaseManager{
    public func UserExists(with email: String,completion: @escaping (Bool) -> Void){
        
        let safeEmail = email.replacingOccurrences(of: ".", with: "_")
        database.child(safeEmail).observeSingleEvent(of: .value, with: {DataSnapshot in
            guard DataSnapshot.value as? String != nil else{
                completion(false)
                return
            }
            completion(true)
        })
    }
    /// Insert new user to the database
    public func insertuser(with user: ChatAppUser) {
        database.child(user.safeEmail).setValue([
            "Username": user.Username,
            "Password": user.password
        ])
    }
}
struct ChatAppUser{
    let emailAddress: String
    let Username: String
    let password: String
    //let ProfilePic: String
    var safeEmail: String{
        let safeEmail = emailAddress.replacingOccurrences(of: ".", with: "_")
        return safeEmail
    }
}
