//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSBezierPath {

    convenience init(arcCenter: CGPoint,
                     radius: CGFloat,
                     startAngle: CGFloat,
                     endAngle: CGFloat,
                     clockwise: Bool) {
        self.init()
        appendArc(withCenter: arcCenter,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: endAngle,
                       clockwise: clockwise)
    }
}
#endif
