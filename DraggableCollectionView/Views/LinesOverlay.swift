//
//  LinesOverlay.swift
//  WordSearch
//
//  Created by TonyNguyen on 5/10/19.
//  Copyright © 2019 Phuc Nguyen. All rights reserved.
//

import Foundation
import UIKit

/// This view 1 temporary lines which is an attempt of the user
/// And permanent lines which are corrected word
public class LinesOverlay: UIView {
    var tempLine: Line?
    var permanentLines: [Line] = []
    
//    var selectingColor: CGColor = UIColor.random.cgColor
//    var selectedColor: CGColor = UIColor.random.cgColor

    /// Row and col should be set externally by the game configurator
    var row: Int = 0
    var col: Int = 0

    /// Should be set externally for future positions computation
    var cellSize: CGSize {
        let w = bounds.width / CGFloat(col)
        let h = bounds.height / CGFloat(row)
        return CGSize(width: w, height: h)
    }

    /// We define styles for temp lines and permanent lines
    lazy public var selectingStyle: LineStyle = LineStyle(
        opacity: 0.3,
        lineWidth: min(cellSize.width, cellSize.height) * 0.8,
        strokeColor: UIColor.random.cgColor
    )

    lazy public var selectedStyle: LineStyle = LineStyle(
        opacity: 0.3,
        lineWidth: min(cellSize.width, cellSize.height) * 0.8,
        strokeColor: UIColor.random.cgColor
    )

    /// Reset the overlay
    func reset() {
        selectingStyle.strokeColor = UIColor.random.cgColor
        layer.sublayers?.forEach { $0.removeFromSuperlayer()}
        removeTempLine()
        permanentLines.removeAll()
        layer.setNeedsDisplay()
    }

    /// Start drawing the temp line
    ///
    /// - Parameter position: start position of the line
    /// 
    func addTempLine(at position: Position) {
        tempLine = Line(style: selectingStyle)
        tempLine?.cellSize = cellSize
        tempLine?.startPos = position
        tempLine?.endPos = position
    }

    /// Draw the line from start position to end position
    /// if it's valid.
    ///
    /// - Parameter position: target end position
    /// - Returns: true if the line should be updated/drawn.
    func moveTempLine(to position: Position) -> Bool {
        if tempLine?.attempt(endPos: position) == true {
            tempLine?.draw(on: self)
            return true
        }
        return false
    }

    /// Remove the temp line
    func removeTempLine() {
        self.tempLine?.removeFromSuperlayer()
        self.tempLine = nil
    }

    /// User has selected a corrected word, convert to a permanent line
    func acceptLastLine() {
        if let permLine = tempLine {
            if permanentLines.contains(permLine) == false {
                selectedStyle.strokeColor = UIColor.random.cgColor
                permLine.lineStyle = selectedStyle
                permanentLines.append(permLine)
                setNeedsDisplay()
            }
        }
    }

    /// Draw function of a UIView object.
    /// This is called when a line changes
    /// Or even orientation changes and the content
    /// mode is et to `Redraw`.
    ///
    /// - Parameter rect: rect
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        tempLine?.cellSize = cellSize
        tempLine?.draw(on: self)
        
        for line in permanentLines {
            line.cellSize = cellSize
            line.draw(on: self)
        }
    }
}
