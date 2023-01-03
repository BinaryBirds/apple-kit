//
//  CGSize+Operations.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGSize {

    static func + (lhs: CGSize, rhs: CGFloat) -> CGSize {
        .init(width: lhs.width + rhs, height: lhs.height + rhs)
    }
    
    static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        .init(width: lhs.width - rhs, height: lhs.height - rhs)
    }
    
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        .init(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        precondition(rhs != 0, "Can't divide using zero.")
        return .init(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    static func += (lhs: inout CGSize, rhs: CGFloat) {
        lhs = lhs + rhs
    }
    
    static func -= (lhs: inout CGSize, rhs: CGFloat) {
        lhs = lhs - rhs
    }
    
    static func *= (lhs: inout CGSize, rhs: CGFloat) {
        lhs = lhs * rhs
    }
    
    static func /= (lhs: inout CGSize, rhs: CGFloat) {
        lhs = lhs / rhs
    }

    static prefix func - (point: CGSize) -> CGSize {
        .init(width: -point.width, height: -point.height)
    }
}
#endif
