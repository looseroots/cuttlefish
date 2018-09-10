//
//  SingleImageCellViewModel.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class SingleImageCellViewModel: LooseRootsCellViewModel {
    var imageURL: URL!
    var defaultImage: UIImage!
    var aspectRatio: CGFloat!
    
    init(imageURL: URL, defaultImage: UIImage, aspectRatio: CGFloat) {
        self.imageURL = imageURL
        self.defaultImage = defaultImage
        self.aspectRatio = aspectRatio
    }
    
    func getHeightOfCell() -> CGFloat {
        return 100
    }
}
