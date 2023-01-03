//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSScreen {

    static var `default`: NSScreen {
        NSScreen.main ?? NSScreen.screens[0]
    }
}
#endif
