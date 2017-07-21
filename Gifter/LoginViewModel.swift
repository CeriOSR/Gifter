//
//  LoginViewModel.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-18.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import Firebase

class LoginViewModel: LoginViewModelProtocol {
    
    var user = User()
    let routable = Routable()
    
    private func fbFriendsGraphRequest() {
        let parameters = ["fields" : "id, first_name, last_name, name, email, picture"]
        FBSDKGraphRequest(graphPath: "/me/friends", parameters: parameters).start { (connection, result, error) in
            if error != nil {
                print(error ?? "error unknows")
                return
            }
            let resultDict = result as? NSDictionary
            let data = resultDict?["data"] as! NSArray
            for i in 0 ..< data.count
            {
                let valueDict : NSDictionary = data[i] as! NSDictionary
                let id = valueDict.object(forKey: "id") as! String
                print("the id value is \(id)")
            }
            
            let friends = resultDict?.object(forKey: "data") as! NSArray
            print("Found \(friends.count) friends")
        }
        
    }
    

    
    private func fbUserGraphRequest(){
        let parameters = ["fields": "email, id, name"]
        FBSDKGraphRequest(graphPath: "/me", parameters: parameters).start { (connection, result, error) in
            if error != nil {
                print(error ?? "error unknows")
                return
            }
            if let userdata = result as? [String: Any] {
                self.user.name = userdata["name"] as? String
                self.user.id = userdata["id"] as? String
                self.user.email = userdata["email"] as? String
                self.enterUserIntoDB(user: self.user)
            }
        }
    }
    
    func loginIntoFirebaseUsingFBCredentials() {
        let accessToken = FBSDKAccessToken.current()
        guard let tokenstring = accessToken?.tokenString else {fatalError()}
        let credentials = FacebookAuthProvider.credential(withAccessToken: tokenstring)
        Auth.auth().signIn(with: credentials) { (user, error) in
            if error != nil {
                print("Something went wrong with login", error ?? "unknown error")
            }
            self.fbUserGraphRequest()
            self.fbFriendsGraphRequest()
        }
    }
    
    private func enterUserIntoDB(user: User) {
        let values = ["name": user.name, "id": user.id, "email": user.email]
        let userRef = Database.database().reference().child("User").childByAutoId()
        userRef.updateChildValues(values as Any as! [AnyHashable : Any]) { (error, ref) in
            if error != nil {
                print(error ?? "unknown error")
            }
//            let layout = UICollectionViewFlowLayout()
//            let friendsListViewController = FriendsListCollectionViewController(collectionViewLayout: layout)
//            let navFriendsListController = UINavigationController(rootViewController: friendsListViewController)
//            self.routable.topViewController()?.present(navFriendsListController, animated: true, completion: nil)
            
        }
    }

}
