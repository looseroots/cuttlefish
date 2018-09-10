//
//  NavigationCollectionViewCell.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/22/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class NavigationCollectionViewCell: UICollectionViewCell {
    var label: UILabel!
    var underline: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        underline = UIView()
        underline.translatesAutoresizingMaskIntoConstraints = false
        addSubview(underline)
        underline.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        underline.widthAnchor.constraint(equalToConstant: 50).isActive = true
        underline.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: underline.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
