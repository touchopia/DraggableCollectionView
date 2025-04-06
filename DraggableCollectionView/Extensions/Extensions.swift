//
//  StringExtension.swift
//  WordSearch
//
//  Created by Phil Wright on 3/10/25.
//

import UIKit

extension Int {
    /// Get display formatted time from number of seconds
    /// E.g. 65s = 01:05
    ///
    /// - Returns: the display string
    func formattedTime() -> String {
        let seconds: Int = self % 60
        let minutes: Int = self / 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension UIColor {
    /// Get a random color with saturation, brightness, and alpha
    ///
    /// - Returns: the uicolor
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 0.5, brightness: 0.9, alpha: 1)
    }
}
