//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
public extension NSTextField {

    var text: String? {
        get { stringValue }
        set { stringValue = newValue ?? "" }
    }
}
#endif
