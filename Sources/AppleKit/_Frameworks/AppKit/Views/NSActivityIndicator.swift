//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class NSActivityIndicatorView: NSProgressIndicator {
    
    public var hidesWhenStopped: Bool {
        get { !isDisplayedWhenStopped }
        set { isDisplayedWhenStopped = !newValue }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        isIndeterminate = true
        style = .spinning
        isDisplayedWhenStopped = false
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        isIndeterminate = true
        style = .spinning
        isDisplayedWhenStopped = false
    }
}


#endif
