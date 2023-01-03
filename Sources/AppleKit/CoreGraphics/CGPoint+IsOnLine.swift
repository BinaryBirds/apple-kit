//
//  CGPoint+IsOnLine.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /**
     Checks if the point is on a given line
     
     Example code
        ```swift
         let p = CGPoint(x: 4, y: 8)
         let l1 = CGPoint(x: 4, y: 2)
         let l2 = CGPoint(x: 4, y: 3)
         
         // r: true
         let r = p.isOnLine(l1, l2)
        ```
     
     - note: Precondition: if the line points are equal (invalid line) it'll trigger an error
     - parameter first: The first point of a line
     - parameter second: The second point of a line
     - returns: If the point is on the line the `true`, otherwise `false`.
     */
    func isOnLine(_ first: CGPoint, _ second: CGPoint) -> Bool {
        precondition(first != second, "Invalid line points")
        return (first.y - y) * (first.x - second.x) == (first.x - x) * (first.y - second.y)
    }
}
#endif
