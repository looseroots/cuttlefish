//
//  FeedOptionsView.swift
//  Conova
//
//  Created by Kevin Bunarjo on 8/23/18.
//  Copyright © 2018 Conova. All rights reserved.
//

import UIKit

protocol FeedOptionsViewDelegate {
    func didSelectOption(option: FeedOptionsView.FeedOption)
}

class FeedOptionsView: UIView {
    enum FeedOption {
        case card
        case list
        case map
        case cancel
    }

    var optionsStackView: UIStackView!
    var cardOptionButton: UIButton!
    var listOptionButton: UIButton!
    var mapOptionButton: UIButton!
    var cancelOptionButton: UIButton!
    var delegate: FeedOptionsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        alpha = 0.4
        
        cardOptionButton = UIButton(type: .custom)
        cardOptionButton.setTitle("Card View", for: .normal)
        cardOptionButton.addTarget(self, action: #selector(FeedOptionsView.didSelectButton(_:)), for: .touchUpInside)
        listOptionButton = UIButton(type: .custom)
        listOptionButton.setTitle("List View", for: .normal)
        listOptionButton.addTarget(self, action: #selector(FeedOptionsView.didSelectButton(_:)), for: .touchUpInside)
        mapOptionButton = UIButton(type: .custom)
        mapOptionButton.setTitle("Map View", for: .normal)
        mapOptionButton.addTarget(self, action: #selector(FeedOptionsView.didSelectButton(_:)), for: .touchUpInside)
        
        cancelOptionButton = UIButton(type: .custom)
        cancelOptionButton.setTitle("Cancel", for: .normal)
        cancelOptionButton.addTarget(self, action: #selector(FeedOptionsView.didSelectButton(_:)), for: .touchUpInside)
        cancelOptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cancelOptionButton)
        cancelOptionButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        cancelOptionButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        cancelOptionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancelOptionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true

        optionsStackView = UIStackView(arrangedSubviews: [cardOptionButton, listOptionButton, mapOptionButton])
        optionsStackView.distribution = .fillEqually
        optionsStackView.axis = .vertical
        optionsStackView.spacing = 0
        optionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(optionsStackView)
        optionsStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        optionsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        optionsStackView.bottomAnchor.constraint(equalTo: cancelOptionButton.topAnchor, constant: -8).isActive = true
        optionsStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func didSelectButton(_ sender: UIButton) {
        if sender == cardOptionButton {
            delegate?.didSelectOption(option: .card)
        } else if sender == listOptionButton {
            delegate?.didSelectOption(option: .list)
        } else if sender == mapOptionButton {
            delegate?.didSelectOption(option: .map)
        } else if sender == cancelOptionButton {
            delegate?.didSelectOption(option: .cancel)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
