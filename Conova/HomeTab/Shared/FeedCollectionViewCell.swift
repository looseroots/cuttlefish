//
//  FeedCollectionViewCell.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/23/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    var title: UILabel!
    var bodyText: UILabel!
    var image: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        image = UIImageView()
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        image.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 3 / 2).isActive = true
        
        title = UILabel()
        title.text = "r/MMA"
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        title.rightAnchor.constraint(equalTo: image.leftAnchor, constant: -12).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        bodyText = UILabel()
        bodyText.numberOfLines = 0
        bodyText.text = "Here we go. UFC announcing Khabib Nurmagomedov vs. Connor McGregor on Oct. 6 in Las Vegas"
        bodyText.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bodyText)
        bodyText.rightAnchor.constraint(equalTo: image.leftAnchor, constant: -12).isActive = true
        bodyText.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        bodyText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        bodyText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
