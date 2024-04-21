//
//  NSColor+Extensions.swift
//
//
//  Created by Dimas on 21/04/24.
//

import AppKit

extension NSColor {
    
    /// Initialize a color with a hex string.
    /// - Parameters:
    ///   - hex: The hex string to parse. It can be prefixed with # or not.
    ///   - alpha: The alpha value of the color. Default is 1.
    public convenience init(hex: String, alpha: Float = 1) {
        // Handle two types of literals: 0x and # prefixed
        var cleanedString = ""
        if hex.hasPrefix("#") {
            cleanedString = String(hex[hex.index(cleanedString.startIndex, offsetBy: 1)..<hex.endIndex])
        } else {
            cleanedString = hex
        }
        
        // Ensure it only contains valid hex characters 0
        let validHexPattern = "[a-fA-F0-9]+"
        if cleanedString.conformsTo(validHexPattern) {
            var value: UInt64 = 0
            Scanner(string: cleanedString).scanHexInt64(&value)
            self.init(hex: Int(value), alpha: 1)
        } else {
            fatalError("Unable to parse color hex string: \(hex)")
        }
    }
    
    private convenience init(hex: Int, alpha: Float = 1) {
        self.init(
            calibratedRed: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
            blue: CGFloat((hex & 0xFF)) / 255.0,
            alpha: 1.0
        )
    }
    
}

private extension String  {
    func conformsTo(_ pattern: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", pattern).evaluate(with: self)
    }
}
