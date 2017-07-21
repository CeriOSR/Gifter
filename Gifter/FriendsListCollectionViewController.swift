//
//  FriendsListCollectionViewController.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-18.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

private let reuseIdentifier = "Cell"

class FriendsListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView?.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        self.collectionView!.register(FriendsListCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkIfUserIsLoggedIn()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsListCell
    
        cell.label.text = "Facebook Friend"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch {
            return
        }
        checkIfUserIsLoggedIn()
    }
    
    private func checkIfUserIsLoggedIn() {
        let loginManager = FBSDKLoginManager()
        let uid = Auth.auth().currentUser?.uid
        if uid == nil {
            loginManager.logOut()
            let loginViewController = LoginViewController()
            self.present(loginViewController, animated: true, completion: nil)
        }
    }

    
}
