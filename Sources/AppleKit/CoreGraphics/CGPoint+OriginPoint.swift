//
//  CGPoint+OriginPoint.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /**
     Calculates the origin point for a given size based on the current point as a center point
     
     Example code
        ```swift
         let p = CGPoint.zero
         let s = CGSize(width: 20, height: 10)
         
         // x: -10, y: -5
         let o = p.originPoint(for: s)
        ```
     
     - parameter size: The size to get the origin point for
     - returns: The origin point for the given size
     */
    func originPoint(for size: CGSize) -> CGPoint {
        .init(x: x - size.width / 2, y: y - size.height / 2)
    }
}
#endif
