//
//  File.swift
//
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class Menu: AppleMenu {

#if canImport(AppKit)
    
    public override init(title: String) {
        super.init(title: title)
    }

    @available(*, unavailable)
    public required init(coder: NSCoder) {
        fatalError("unavailable")
    }
#endif

#if canImport(UIKit)
    public convenience init(title: String) {
        self.init(
            title: title,
            image: nil,
            identifier: nil,
            options: [],
            children: []
        )
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }
#endif
}

