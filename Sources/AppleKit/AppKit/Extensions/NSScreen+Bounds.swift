//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSScreen {

    var bounds: CGRect { NSRectToCGRect(self.visibleFrame) }
}
#endif
