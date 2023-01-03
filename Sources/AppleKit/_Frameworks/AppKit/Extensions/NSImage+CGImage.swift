//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSImage {
    
    var cgImage: CGImage? {
        let imageData = tiffRepresentation
        let dataSource = CGImageSourceCreateWithData(imageData! as CFData, nil)!
        let maskRef = CGImageSourceCreateImageAtIndex(dataSource, 0, nil)
        return maskRef
    }
}
#endif
