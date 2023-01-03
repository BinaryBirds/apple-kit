//
//  CGPoint+MiddlePoint.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /**
     Calculates the middle point between the current point and a given destination point
     
     Example code
        ```swift
         let p1 = CGPoint(x: 4, y: 2)
         let p2 = CGPoint(x: 6, y: 9)

         // x: 5.0, y: 5.5
         let m = p1.middlePoint(to: p2)
        ```
     
     - parameter point: The other point to use as a destination point
     - returns: The middle point between the two points
     */
    func middlePoint(to point: CGPoint) -> CGPoint {
        guard self != point else {
            return point
        }
        return .init(x: (x + point.x) / 2, y: (y + point.y) / 2)
    }
}
#endif
