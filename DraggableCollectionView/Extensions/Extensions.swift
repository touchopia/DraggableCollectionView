//
//  StringExtension.swift
//  WordSearch
//
//  Created by TonyNguyen on 5/10/19.
//  Copyright © 2019 Phuc Nguyen. All rights reserved.
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
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 0.5, brightness: 0.9, alpha: 1)
    }
}
