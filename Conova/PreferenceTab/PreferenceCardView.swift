//
//  PreferenceCardView.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/24/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class PreferenceCardView: UIView {
    var imageView: UIImageView!
    var noButton: UIButton!
    var yesButton: UIButton!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
