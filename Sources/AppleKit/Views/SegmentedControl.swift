//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class SegmentedControl: AppleSegmentedControl {

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
