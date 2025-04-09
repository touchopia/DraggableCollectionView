//
//  Untitled.swift
//  DraggableCollectionView
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

class TrustBoundaryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Create UITextView
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text =
"""
Trust Boundary Continuum

INSTRUCTIONS

    The following is an exercise on creating both trust and boundary continuums.

    This exercise aims to help you become more mindful of how trust influences how you set boundaries.

    When the continuums are side by side it gives a better picture of the types of boundaries that would be most helpful in protecting your mental, physical, emotional and spiritual health.

    Your continuums can also help create expectations you need in order to feel safe in your relationships.

    The continuums will be individualized because not everyone has the same values, wants, needs and life experiences.

    ** Trust is not a fixed status in relationships, trust can increase or decrease depending on behaviors and circumstances.

    Copyright 2023: Lithesome Do Not Copy without Permission
"""
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = true

        // Add UITextView to UIView
        self.addSubview(textView)

        // Constraints for UITextView
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
