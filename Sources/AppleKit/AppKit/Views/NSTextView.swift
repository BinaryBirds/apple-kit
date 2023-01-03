//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class TextView: NSTextView {

    public init(textContainer: NSTextContainer? = nil) {
        super.init(frame: .zero, textContainer: textContainer)

        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect, textContainer: NSTextContainer?) {
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
