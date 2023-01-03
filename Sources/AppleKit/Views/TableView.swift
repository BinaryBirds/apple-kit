//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class TableView: AppleTableView {
    
    public init(style: AppleTableViewStyle = .plain) {
#if canImport(AppKit)
        super.init(frame: .zero)
        
        self.style = style
#endif
#if canImport(UIKit)
        super.init(frame: .zero, style: style)
#endif
        initialize()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }
    
#if canImport(UIKit)
    @available(*, unavailable)
    private override init(frame: CGRect, style: UITableView.Style) {
        fatalError("unavailable")
    }
#endif
 
#if canImport(AppKit)
    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("unavailable")
    }
#endif
    
    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
