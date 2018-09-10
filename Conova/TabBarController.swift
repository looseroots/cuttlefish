//
//  TabBarController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/22/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    func setupTabs() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach a tab bar button to each of the navigation controllers
        
        // Home
        let homeNavigationController = HomeNavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        addChildViewController(homeNavigationController)

        // Preference Learning
        let preferenceNavigationController = PreferenceNavigationController()
        preferenceNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        addChildViewController(preferenceNavigationController)
        
        // Edit
        
        
        // Chat
        
        
        // Bookmarks
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

