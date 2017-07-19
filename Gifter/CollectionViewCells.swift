//
//  CollectionViewCells.swift
//  Gifter
//
//  Created by Rey Cerio on 2017-07-18.
//  Copyright © 2017 Rey Cerio. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

class FriendsListCell: BaseCell {
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
        
    }
}
