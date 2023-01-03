//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class NSLabel: NSTextField {

    public var numberOfLines: Int {
        get { maximumNumberOfLines }
        set { maximumNumberOfLines = newValue }
    }

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        initialize()
        
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    private func initialize() {
        drawsBackground = false
        isBordered = false
        isEditable = false
//        alignment = .left
        maximumNumberOfLines = 1
        lineBreakMode = .byTruncatingTail
    }
}

#endif
