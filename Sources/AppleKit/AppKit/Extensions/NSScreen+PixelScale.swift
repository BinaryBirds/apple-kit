//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSScreen {

    static var pixelScale: CGFloat {
        1.0 / Self.default.backingScaleFactor
    }
}
#endif
