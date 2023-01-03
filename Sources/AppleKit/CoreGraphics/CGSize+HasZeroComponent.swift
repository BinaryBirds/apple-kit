//
//  CGSize+HasZeroComponent.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGSize {

    /// Check if a given size has zero with or height
    var hasZeroComponent: Bool {
        width == 0 || height == 0
    }
}
#endif
