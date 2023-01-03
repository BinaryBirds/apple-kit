//
//  CGPoint+ControlPoint.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    /**
     Gets the x control point (bezier path) from a given point
     
     - parameter point: The another point
     - returns: The middle control point
     */
    func xControlPoint(to point: CGPoint) -> CGPoint {
        var middleControlPoint = middlePoint(to: point)
        guard x != point.x else {
            return middleControlPoint
        }
        let dx = CGFloat(abs(point.x - middleControlPoint.x))
        if x < point.x {
            middleControlPoint.x += dx
        }
        else if x > point.x {
            middleControlPoint.x -= dx
        }
        return middleControlPoint
    }
    
    /**
     Gets the y control point (bezier path) from a given point
     
     - parameter point: The another point
     - returns: The middle control point
     */
    func yControlPoint(to point: CGPoint) -> CGPoint {
        var middleControlPoint = middlePoint(to: point)
        guard y != point.y else {
            return middleControlPoint
        }
        let dy = CGFloat(abs(point.y - middleControlPoint.y))
        if y < point.y {
            middleControlPoint.y += dy
        }
        else if y > point.y {
            middleControlPoint.y -= dy
        }
        return middleControlPoint
    }
}
#endif
