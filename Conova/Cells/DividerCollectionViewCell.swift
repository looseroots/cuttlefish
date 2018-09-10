//
//  DividerCollectionViewCell.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class DividerCollectionViewCell: UICollectionViewCell, LooseRootsCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let dividerView = UIView()
        dividerView.backgroundColor = .gray
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        dividerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dividerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        dividerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: LooseRootsCellViewModel) {
        return
    }
}

class DividerCellViewModel: LooseRootsCellViewModel {
    func getHeightOfCell() -> CGFloat {
        return 2
    }
}
