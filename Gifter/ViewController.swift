//
//  ViewController.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-10.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginViewModel = LoginViewModel()
    let routable = Routable()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
        view.addSubview(loginButton)
        
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: loginButton)
        view.addConstraintsWithFormat(format: "V:|-400-[v0(50)]", views: loginButton)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
        }
        loginViewModel.loginIntoFirebaseUsingFBCredentials()
        let layout = UICollectionViewFlowLayout()
        let friendsListViewController = FriendsListCollectionViewController(collectionViewLayout: layout)
        let navFriendsListController = UINavigationController(rootViewController: friendsListViewController)
        self.routable.topViewController()?.present(navFriendsListController, animated: true, completion: nil)
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did logout of facebook!")
    }
    
}

