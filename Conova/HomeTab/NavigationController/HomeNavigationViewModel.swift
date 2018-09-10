//
//  HomeNavigationViewModel.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/22/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class HomeNavigationViewModel {
    private static let initialViewControllerIndex = 1
    private let titles = ["For You", "Home", "Local"]
    private var selectedCell: NavigationCollectionViewCell!
    
    func numberOfNavigationTabs() -> Int {
        return titles.count
    }
    
    func titleForNavigationTab(at indexPath: IndexPath) -> String {
        return titles[indexPath.item]
    }

    func didSelectCell(cell: NavigationCollectionViewCell) {
        selectedCell.underline.backgroundColor = .white
        cell.underline.backgroundColor = .black
        selectedCell = cell
    }
    
    func configureCell(cell: NavigationCollectionViewCell, at indexPath: IndexPath) {
        cell.backgroundColor = .white
        cell.label.text = titleForNavigationTab(at: indexPath)
        if indexPath.item == HomeNavigationViewModel.initialViewControllerIndex {
            selectedCell = cell
            cell.underline.backgroundColor = .black
        }
    }
}
