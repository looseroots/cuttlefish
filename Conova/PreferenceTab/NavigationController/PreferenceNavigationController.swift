//
//  PreferenceNavigationController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/24/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class PreferenceNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewController = PreferenceViewController()
        pushViewController(viewController, animated: false)
        viewController.title = "Preference Learning"
    }
}
