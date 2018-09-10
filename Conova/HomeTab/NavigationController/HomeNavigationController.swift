//
//  HomeNavigationController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/22/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController {
    override func viewDidLoad() {
        // setup first
        pushViewController(HomeViewController(), animated: false)
    }
}
