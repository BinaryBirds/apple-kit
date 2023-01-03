//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(UIKit)

open class UIBox: UIView {
    
}

open class Box: UIBox {

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
