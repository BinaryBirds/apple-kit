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
}

open class Label: NSLabel {

    public init() {
        super.init(frame: .zero)

        drawsBackground = false
        isBordered = false
        isEditable = false
//        alignment = .left
        maximumNumberOfLines = 1
        lineBreakMode = .byTruncatingTail

        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("unavailable")
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
        
}
#endif
