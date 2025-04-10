//
//  WordCollectionViewCell.swift
//  WordSearch
//
//  Created by TonyNguyen on 5/10/19.
//  Copyright © 2019 Phuc Nguyen. All rights reserved.
//

import UIKit

class WordCollectionViewCell: UICollectionViewCell {

    static let cellId = "WordCell"
    
    private let fontName: String = "Avenir Next Medium"
    private let fontSize: CGFloat = 18.0
    private let textColor: UIColor = .white
    
    private var font:UIFont {
        return UIFont(name: fontName, size: fontSize)!
    }
    
    @IBOutlet weak var label: UILabel!

    func configure(with text: String, selected: Bool) {
        if selected {
            // Strike through the word if it's selected.
            let attrString = NSMutableAttributedString(string: text)
            let attrsDict = [
                NSAttributedString.Key.strikethroughStyle: 2,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
            attrString.addAttributes(attrsDict, range: NSRange(location: 0, length: text.count))
            label.attributedText = attrString
        } else {
            let attrString = NSMutableAttributedString(string: text)
            let attrsDict = [
                NSAttributedString.Key.strikethroughStyle: 0,
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
            attrString.addAttributes(attrsDict, range: NSRange(location: 0, length: text.count))
            label.attributedText = attrString
            label.textColor = self.textColor
            label.font = self.font
        }
    }
}
