//
//  LoginTransitionController.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-21.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import UIKit

class LoginTransitionController: UIViewController {
    
    let routable = Routable()
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.loginViewModel.loginIntoFirebaseUsingFBCredentials()
        self.loginViewModel.fbUserGraphRequest()
        let layout = UICollectionViewFlowLayout()
        let friendListCollectionViewController = FriendsListCollectionViewController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: friendListCollectionViewController)
        self.routable.topViewController()?.present(navController, animated: true, completion: nil)

    }
    
    
    
}
