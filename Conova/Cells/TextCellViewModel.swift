//
//  TextCellViewModel.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class TextCellViewModel: LooseRootsCellViewModel {
    var text: String!
    var style: UIFont?
    var color: UIColor?
    var alignment: NSTextAlignment!
    
    init(text: String, style: UIFont?, color: UIColor?, alignment: NSTextAlignment) {
        self.text = text
        self.style = style
        self.color = color
        self.alignment = alignment
    }
    
    func getHeightOfCell() -> CGFloat {
        return 100
    }
}
