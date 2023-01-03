//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
public extension NSTextField {

    var placeholder: String? {
        get { placeholderString }
        set { placeholderString = newValue }
    }
}
#endif
