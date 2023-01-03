//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSImage {

    func tint(color: NSColor) -> NSImage {
        let tinted = copy() as! NSImage
        tinted.lockFocus()
        color.set()
        let imageRect = NSRect(origin: .zero, size: size)
        imageRect.fill(using: .sourceAtop)
        tinted.unlockFocus()
        return tinted
    }
}
#endif
