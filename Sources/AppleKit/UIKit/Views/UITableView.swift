//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(UIKit)
open class TableView: UITableView {
    
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

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
#endif
