//
//  ProfileViewController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/25/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

protocol LooseRootsCellViewModel {
    func getHeightOfCell() -> CGFloat
}

protocol LooseRootsCollectionViewCell {
    func configure(with viewModel: LooseRootsCellViewModel)
}

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    enum CollectionViewTypes: String {
        case image = "image"
        case text = "text"
        case divider = "divider"
        case event = "event"
    }
    
    enum ProfileDataTypes {
        case profileImage
        case name
        case description
        case event
        case none
    }
    
    var collectionView: UICollectionView!
    
    var cellViewModels: [LooseRootsCellViewModel] = [
        SingleImageCellViewModel(imageURL: URL(fileURLWithPath: "http://wwww.facebook.com"), defaultImage: UIImage(), aspectRatio: 0.40),
        TextCellViewModel(text: "Kevin Bunarjo", style: nil, color: nil, alignment: .left),
        TextCellViewModel(text: "This is my description", style: nil, color: .lightGray, alignment: .left),
        TextCellViewModel(text: "Events", style: nil, color: nil, alignment: .left),
        DividerCellViewModel()
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = cellViewModels[indexPath.item]
        var cell: CollectionViewCell!
        
        if let imageViewModel = cellViewModel as? SingleImageCellViewModel {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewTypes.image.rawValue, for: indexPath) as! SingleImageCollectionViewCell
            cell.configure(with: imageViewModel)
        } else if let textViewModel = cellViewModel as? TextCellViewModel {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewTypes.text.rawValue, for: indexPath) as! TextCollectionViewCell
            cell.configure(with: textViewModel)
        } else if let dividerViewModel = cellViewModel as? DividerCellViewModel {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewTypes.divider.rawValue, for: indexPath) as! DividerCollectionViewCell
            cell.configure(with: dividerViewModel)
        } else if let eventViewModel = cellViewModel as? EventCellViewModel {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewTypes.event.rawValue, for: indexPath) as! EventCollectionViewCell
            cell.configure(with: eventViewModel)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = cellViewModels[indexPath.item].getHeightOfCell()
        return CGSize(width: width, height: height)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .white
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        let navigationHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationHeight).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // register cells
        collectionView.register(SingleImageCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewTypes.image.rawValue)
        collectionView.register(TextCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewTypes.text.rawValue)
        collectionView.register(DividerCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewTypes.divider.rawValue)
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewTypes.event.rawValue)
    }
}
