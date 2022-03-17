//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class View: AppleView {

    public init() {
        super.init(frame: .zero)

        self.initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("not available")
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("not available")
    }

    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
