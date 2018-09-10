//
//  HomeViewController.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/22/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, FeedOptionsViewDelegate {
    var navigationCollectionView: UICollectionView!
    var feed: UICollectionView!
    var feedOptionsContainerView: UIView!
    var feedOptionsView: FeedOptionsView!
    let navigationViewModel = HomeNavigationViewModel()
    
    @objc func openProfileView() {
        let controllerToDisplay = ProfileViewController()
        navigationController?.pushViewController(controllerToDisplay, animated: true)
    }

    func didSelectOption(option: FeedOptionsView.FeedOption) {
        feedOptionsView.isHidden = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == navigationCollectionView {
            return navigationViewModel.numberOfNavigationTabs()
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == navigationCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NavigationCollectionViewCell
            navigationViewModel.configureCell(cell: cell, at: indexPath)
            return cell
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == navigationCollectionView {
            let width = collectionView.frame.width / 3
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        }
        let width = collectionView.frame.width
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == navigationCollectionView {
            // change the feed
            let cell = collectionView.cellForItem(at: indexPath) as! NavigationCollectionViewCell
            navigationViewModel.didSelectCell(cell: cell)
        }
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @objc func openOptionsView() {
        feedOptionsView.isHidden = false
    }
    
    private func setupFeedTypeSelection() {
        navigationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        navigationCollectionView.delegate = self
        navigationCollectionView.dataSource = self
        navigationCollectionView.backgroundColor = .gray
        navigationCollectionView.register(NavigationCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        navigationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(navigationCollectionView)
        let navigationHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0)
        
        navigationCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: navigationHeight).isActive = true
        navigationCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        navigationCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        navigationCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        feedOptionsContainerView = UIView()
        feedOptionsContainerView.backgroundColor = .lightGray
        
        setupFeedTypeSelection()
        
        let optionsButton = UIButton(type: .custom)
        optionsButton.setTitle("", for: .normal)
        optionsButton.backgroundColor = .darkGray
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.addTarget(self, action: #selector(openOptionsView), for: .touchUpInside)
        feedOptionsContainerView.addSubview(optionsButton)
        optionsButton.rightAnchor.constraint(equalTo: feedOptionsContainerView.rightAnchor, constant: -16).isActive = true
        optionsButton.topAnchor.constraint(equalTo: feedOptionsContainerView.topAnchor, constant: 6).isActive = true
        optionsButton.bottomAnchor.constraint(equalTo: feedOptionsContainerView.bottomAnchor, constant: -6).isActive = true
        optionsButton.widthAnchor.constraint(equalTo: optionsButton.heightAnchor).isActive = true
        
        feedOptionsContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feedOptionsContainerView)
        let navigationHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0) + 50
        feedOptionsContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationHeight).isActive = true
        feedOptionsContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        feedOptionsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedOptionsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        feed = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        feed.backgroundColor = .white
        feed.delegate = self
        feed.dataSource = self
        feed.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        feed.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feed)

        let tabHeight = (self.navigationController?.tabBarController?.tabBar.frame.height ?? 0)
        feed.topAnchor.constraint(equalTo: feedOptionsContainerView.bottomAnchor).isActive = true
        feed.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * tabHeight).isActive = true
        feed.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feed.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        feedOptionsView = FeedOptionsView()
        feedOptionsView.isHidden = true
        feedOptionsView.delegate = self
        feedOptionsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feedOptionsView)
        feedOptionsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedOptionsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        feedOptionsView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationHeight).isActive = true
        feedOptionsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * tabHeight).isActive = true
        
        // setup the profile icon (left bar button)
        let profileImageButton = UIButton(type: .custom)
        profileImageButton.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        //        profileImageButton.setImage(imageCache.getProfileImage(), for: .normal)
        profileImageButton.backgroundColor = .darkGray
        profileImageButton.layer.cornerRadius = 35 / 2
        profileImageButton.layer.masksToBounds = true
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.addTarget(self, action: #selector(self.openProfileView), for: .touchUpInside)
        profileImageButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        let profileButton = UIBarButtonItem(customView: profileImageButton)
        
        navigationItem.leftBarButtonItem = profileButton
    }
}
