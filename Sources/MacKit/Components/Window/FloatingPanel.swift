//
//  FloatingPanel.swift
//
//
//  Created by Dimas on 21/04/24.
//

import AppKit

/// A floating panel that will closed when it's resigning or esc key is pressed.
public class FloatingPanel: NSPanel {
    
    public init(frame: CGRect = .zero, styleMask: NSWindow.StyleMask = []) {
        
        func makeStyleMask(customizedStyeMask: NSWindow.StyleMask) -> NSWindow.StyleMask {
            let defaultStyeMask: [NSWindow.StyleMask] = [.nonactivatingPanel, .titled]
            var combinedStyeMask: NSWindow.StyleMask = customizedStyeMask
            
            defaultStyeMask.forEach { c in
                combinedStyeMask.remove(c)
                combinedStyeMask.insert(c)
            }
            
            return combinedStyeMask
        }
        
        let combinedStyeMask = makeStyleMask(customizedStyeMask: styleMask)
        
        super.init(
            contentRect: frame,
            styleMask: combinedStyeMask,
            backing: .buffered,
            defer: false
        )
        
        level = .floating
        isFloatingPanel = true
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
    }
    
    public override func resignKey() {
        super.resignKey()
        close()
    }
    
    public override func cancelOperation(_ sender: Any?) {
        close()
    }
    
}
