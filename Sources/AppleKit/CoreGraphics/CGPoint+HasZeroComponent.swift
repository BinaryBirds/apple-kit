//
//  CGPoint+HasZeroComponent.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /// Check if a given point has zero x or y value
    var hasZeroComponent: Bool {
        x == 0 || y == 0
    }
}
#endif
