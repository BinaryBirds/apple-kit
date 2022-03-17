//
//  CollectionViewSection.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

#if canImport(UIKit)
open class ReusableSection {

    open var layout: ReusableLayout?
    open var header: ReusableItemProtocol?
    open var footer: ReusableItemProtocol?
    open var items: [ReusableItemProtocol]

    public init(layout: ReusableLayout? = nil,
                header: ReusableItemProtocol? = nil,
                footer: ReusableItemProtocol? = nil,
                items: [ReusableItemProtocol] = []) {
        self.layout = layout
        self.header = header
        self.footer = footer
        self.items = items
    }
}
#endif
