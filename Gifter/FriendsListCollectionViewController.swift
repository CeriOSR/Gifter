//
//  FriendsListCollectionViewController.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-18.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsListCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.collectionView!.register(FriendsListCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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

    
}
