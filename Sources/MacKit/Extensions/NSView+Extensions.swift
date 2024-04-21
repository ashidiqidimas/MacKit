//
//  NSView+Extensions.swift
//
//
//  Created by Dimas on 21/04/24.
//

import AppKit

extension NSView {
    
    /// Set the `translatesAutoresizingMaskIntoConstraints` property to `false`
    public func forAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    /// The background color of the view.
    ///
    /// It will set `wantsLayer` to `true` if it's not already set.
    public var backgroundColor: NSColor? {
        get {
            guard let cgColor = layer?.backgroundColor else { return nil }
            return NSColor(cgColor: cgColor)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
    
}
