//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class ScrollView: AppleScrollView {

    @available(*, unavailable)
    private override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init() {
        super.init(frame: .zero)

        self.initialize()
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
