//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSView {

    var accessibilityIdentifier: String? {
        get {
            accessibilityIdentifier()
        }
        set {
            setAccessibilityIdentifier(newValue)
        }
    }
}
#endif
