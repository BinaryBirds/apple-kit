//
//  CGPath+SmoothLine.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPath {

    /**
     Creates a smooth CGPath using middle Y bezier curve control points from the given points of array
     
     - parameter points: The array of points
     - returns: The line created from the points
     */
    static func smoothLine(points: [CGPoint]) -> CGPath {
        let path = CGMutablePath()
        guard let firstPoint = points.first else {
            return path
        }
        path.move(to: firstPoint)
        if let lastPoint = points.last, points.count == 2 {
            path.addLine(to: lastPoint)
            return path
        }
        var previousPoint = firstPoint
        for point in points {
            let midPoint = previousPoint.middlePoint(to: point)
            let firstControlPoint = midPoint.yControlPoint(to: previousPoint)
            let secondControlPoint = midPoint.yControlPoint(to: point)
            path.addQuadCurve(to: midPoint, control: firstControlPoint)
            path.addQuadCurve(to: point, control: secondControlPoint)
            previousPoint = point
        }
        return path
    }
}
#endif
