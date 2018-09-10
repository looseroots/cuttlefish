//
//  TextCollectionViewCell.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell, LooseRootsCollectionViewCell {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LooseRootsCellViewModel) {
        if let viewModel = viewModel as? TextCellViewModel {
            label.textAlignment = viewModel.alignment
            label.font = viewModel.style
            label.textColor = viewModel.color
            label.text = viewModel.text
        }
    }
}
