//
//  CGPoint+Operations.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGPoint {

    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        .init(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        precondition(!rhs.hasZeroComponent, "Can't divide using zero component.")
        return .init(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }
    
    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    static func *= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs * rhs
    }
    
    static func /= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs / rhs
    }

    static prefix func - (point: CGPoint) -> CGPoint {
        .init(x: -point.x, y: -point.y)
    }
}
#endif
