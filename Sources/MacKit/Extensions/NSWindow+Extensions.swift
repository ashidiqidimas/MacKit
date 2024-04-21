//
//  NSWindow+Extensions.swift
//
//
//  Created by Dimas on 21/04/24.
//

import AppKit

extension NSWindow {
    
    public func setContentViewController(_ viewController: NSViewController) {
        contentView = viewController.view
        contentViewController = viewController
    }
    
}
