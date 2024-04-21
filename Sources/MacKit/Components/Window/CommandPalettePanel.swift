//
//  CommandPalettePanel.swift
//
//
//  Created by Dimas on 21/04/24.
//

import AppKit

/// A floating panel that is used for command palette.
///
/// This panel make sure that it will not have window buttons and will reactive the previous application when closed.
public class CommandPalettePanel: FloatingPanel {
    
    public init(frame: CGRect = .zero) {
        super.init(frame: frame, styleMask: [])
        
        styleMask.remove(.closable)
        styleMask.remove(.resizable)
        styleMask.remove(.miniaturizable)
        styleMask.remove(.fullScreen)
        isMovable = false
    }
    
    public override func close() {
        guard isVisible else {
            return
        }
        
        super.close()
        
        let isLastWindow = NSApplication.shared.windows.count == 1
        if isLastWindow {
            NSApp.hide(self)
        }
    }
    
}
