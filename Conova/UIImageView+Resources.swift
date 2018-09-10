//
//  UIImageView+Resources.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(with url: URL, usingDefaultImage defaultImage: UIImage) {
        image = defaultImage
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
