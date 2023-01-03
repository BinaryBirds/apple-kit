//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class ActivityIndicator: AppleActivityIndicator {

    public init() {
        super.init(frame: .zero)

        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("unavailable")
    }

    #if canImport(UIKit)
    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("unavailable")
    }
    #endif

    #if canImport(AppKit)
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }
    #endif

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
