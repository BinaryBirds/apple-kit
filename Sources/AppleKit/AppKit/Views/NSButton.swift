//
//  File.swift
//
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
open class Button: NSButton {
    
    public init() {
        super.init(frame: .zero)

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
