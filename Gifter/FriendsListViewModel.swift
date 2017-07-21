//
//  FriendsListViewModel.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-20.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class FriendsListViewModel {
    
    var friends = [Friends]()
    
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
                
                var friends = Friends()
                friends.id = valueDict.object(forKey: "id") as? String
                friends.firstName = valueDict.object(forKey: "first_name") as? String
                friends.lastName = valueDict.object(forKey: "last_name") as? String
                friends.name = valueDict.object(forKey: "name") as? String
                friends.email = valueDict.object(forKey: "email") as? String
                friends.picture = valueDict.object(forKey: "picture") as AnyObject
                
                print(friends.id!)
                print(friends.firstName!)
                print(friends.lastName!)
                print(friends.name!)
                print(friends.email!)
                print(friends.picture!)
                print("the id value is \(id)")
            }
            
            let friends = resultDict?.object(forKey: "data") as! NSArray
            print("Found \(friends.count) friends")
            print((friends[0] as AnyObject))
        }
        
    }

}
