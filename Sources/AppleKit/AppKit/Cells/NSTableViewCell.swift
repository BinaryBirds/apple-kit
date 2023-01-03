//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class TableViewCell: NSTableCellView {

    public init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }
}
#endif
