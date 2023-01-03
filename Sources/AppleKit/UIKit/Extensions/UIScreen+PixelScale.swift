//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
public extension UIScreen {

    static var pixelScale: CGFloat {
        1.0 / Self.default.scale
    }
}
#endif
