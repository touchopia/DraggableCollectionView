//
//  GridCollectionViewCell.swift
//  WordSearch
//
//  Created by TonyNguyen on 5/9/19.
//  Copyright © 2019 Phuc Nguyen. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "GridCell"
    
    private let animationScaleFactor: CGFloat = 1.5
    
    private let fontName: String = "Avenir Next Medium"
    
    private let fontSize: CGFloat = 24.0
    
    private var fontColor: UIColor = .black
    
    private var animatedFontColor: UIColor = .black
    
    private let pixelsToMove: CGFloat = 5.0
    
    private var isAnimating: Bool = false
    
    private var font:UIFont {
        return UIFont(name: fontName, size: fontSize)!
    }
    
    @IBOutlet weak var label: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected && self.isAnimating == false {
                self.isAnimating = true
                UIView.animate(withDuration: 0.3,
                               delay: 0,
                               options: .curveEaseOut,
                               animations: {
                    var labelFrame = self.label.frame
                    labelFrame.origin.y -= self.pixelsToMove
                    self.label.frame = labelFrame
                    self.label.textColor = self.animatedFontColor
                }, completion: { finished in
                    
                    UIView.animate(withDuration: 0.3,
                                   delay: 0,
                                   options: .curveEaseIn) {
                        var labelFrame = self.label.frame
                        labelFrame.origin.y += self.pixelsToMove
                        self.label.textColor = self.fontColor
                        self.label.frame = labelFrame
                        self.isAnimating = false
                    }
                })
            }
        }
    }
}
