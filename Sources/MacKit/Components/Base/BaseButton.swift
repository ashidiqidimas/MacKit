//
//  BaseButton.swift
//  
//
//  Created by Dimas on 21/04/24.
//

import AppKit

public class BaseButton: NSButton {
    
    private var onClick: (() -> Void)?
    
    public init(onClick: (() -> Void)? = nil) {
        super.init(frame: .zero)
        self.onClick = onClick
        target = self
        action = #selector(onClickAction)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onClickAction() {
        onClick?()
    }
}
