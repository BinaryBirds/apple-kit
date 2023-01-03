//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSImage {

    func resize(to size: CGSize) -> NSImage {
        let img = NSImage(size: size)
        img.lockFocus()
        let ctx = NSGraphicsContext.current
        ctx?.imageInterpolation = .high
        let rect = NSRect(origin: .zero, size: size)
        self.draw(in: rect, from: rect, operation: .copy, fraction: 1)
        img.unlockFocus()
        return img
    }
}
#endif
