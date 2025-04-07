//
//  CardView.swift
//  TinderSwiper
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

class CardView: UIView {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    init(profile: Profile) {
        super.init(frame: .zero)
        setupView(profile: profile)
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(profile: Profile) {
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        
        imageView.image = UIImage(named: profile.imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        nameLabel.text = profile.name
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
    private func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 5
    }
}

