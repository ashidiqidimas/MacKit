import AppKit

extension NSWindow {
    public func setContentViewController(_ viewController: NSViewController) {
        contentView = viewController.view
        contentViewController = viewController
    }
}

public class FloatingPanel: NSPanel {
    
    public init() {
        super.init(
            contentRect: .zero,
            styleMask: [.fullSizeContentView, .nonactivatingPanel, .titled],
            backing: .buffered,
            defer: false
        )
        level = .floating
        isFloatingPanel = true
        isMovable = false
        titlebarAppearsTransparent = true
        titleVisibility = .hidden
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
    
    public override func resignKey() {
        super.resignKey()
        close()
    }
    
    public override func cancelOperation(_ sender: Any?) {
        super.cancelOperation(sender)
        close()
    }
    
}

