//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class TextView: UITextView {

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
