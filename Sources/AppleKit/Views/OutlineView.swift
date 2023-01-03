//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class OutlineView: AppleOutlineView {

    #if canImport(UIKit)
    public init(style: UITableView.Style = .plain) {
        super.init(frame: .zero, style: style)

        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect, style: UITableView.Style) {
        fatalError("unavailable")
    }

    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("unavailable")
    }
    #endif
    
    #if canImport(AppKit)
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
    #endif

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
