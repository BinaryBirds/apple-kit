//
//  CGRect+Points.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGRect {

    /// A point with the smallest X and Y value of the rectangle
    var minXminY: CGPoint { .init(x: minX, y: minY) }
    /// A point with the smallest X and center Y value of the rectangle
    var minXmidY: CGPoint { .init(x: minX, y: midY) }
    /// A point with the smallest X and largest Y value of the rectangle
    var minXmaxY: CGPoint { .init(x: minX, y: maxY) }
    /// A point with the center X and smallest Y value of the rectangle
    var midXminY: CGPoint { .init(x: midX, y: minY) }
    /// A point with the center X and center Y value of the rectangle
    var midXmidY: CGPoint { .init(x: midX, y: midY) }
    /// A point with the center X and largest Y value of the rectangle
    var midXmaxY: CGPoint { .init(x: midX, y: maxY) }
    /// A point with the largest X and smallest Y value of the rectangle
    var maxXminY: CGPoint { .init(x: maxX, y: minY) }
    /// A point with the largest X and center Y value of the rectangle
    var maxXmidY: CGPoint { .init(x: maxX, y: midY) }
    /// A point with the largest X and largest Y value of the rectangle
    var maxXmaxY: CGPoint { .init(x: maxX, y: maxY) }
    /// A point with the center X and center Y value of the rectangle
    var center: CGPoint { midXmidY }
}
#endif
