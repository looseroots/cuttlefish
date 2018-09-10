//
//  SingleImageCollectionViewCell.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class SingleImageCollectionViewCell: UICollectionViewCell, LooseRootsCollectionViewCell {
    var viewModel: SingleImageCellViewModel!
    
    var imageView: UIImageView!
    var imageViewWidthConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageViewWidthConstraint = imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
        imageViewWidthConstraint.isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LooseRootsCellViewModel) {
        if let viewModel = viewModel as? SingleImageCellViewModel {
            self.viewModel = viewModel
            imageView.setImage(with: viewModel.imageURL, usingDefaultImage: viewModel.defaultImage)
            imageViewWidthConstraint.isActive = false
            imageViewWidthConstraint = imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: viewModel.aspectRatio)
            imageViewWidthConstraint.isActive = true
        }
    }
}
