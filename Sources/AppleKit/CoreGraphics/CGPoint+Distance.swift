//
//  CGPoint+Distance.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /**
     Checks the distance to another point
     
     Example code
        ```swift
         let p1 = CGPoint(x: 4, y: 2)
         let p2 = CGPoint(x: 4, y: 1)

         // d: 1
         let d = p1.distance(to: p2)
        ```
     
     - parameter to: The point to measure the distance
     - returns: The distance to the other point
     */
    func distance(to: CGPoint) -> CGFloat {
        guard self != to else {
            return 0
        }
        let dx = x - to.x
        let dy = y - to.y
        return sqrt(dx * dx + dy * dy)
    }
}
#endif
