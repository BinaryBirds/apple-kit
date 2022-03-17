//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

#if canImport(UIKit)
public extension UIEdgeInsets {

    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }

    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
#endif
