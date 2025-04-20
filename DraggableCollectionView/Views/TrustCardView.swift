//
//  CardView.swift
//  TinderSwiper
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

class TrustCardView: UIView {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let fontName: String = "Avenir Next Medium"
    private let fontSize: CGFloat = 26.0
    
    init(profile: Profile) {
        super.init(frame: .zero)
        setupView(profile: profile)
        addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(profile: Profile) {
        backgroundColor = .clear
        layer.cornerRadius = 15
        clipsToBounds = true
        
        imageView.image = UIImage(named: profile.imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        nameLabel.text = profile.name.uppercased()
        nameLabel.font = UIFont(name: fontName, size: fontSize)!
        
        
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.random.withAlphaComponent(1)
        nameLabel.textColor = .white
        
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
