//
//  CGRect+ScaleTo.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGRect {

    /**
     Returns the rect that fits in the given rect
     
     - parameter rect: The rect to fit into
     - returns: The scaled rect that fits into the given rect
     */
    func scaleToFit(in rect: CGRect) -> CGRect {
        let scale = size.scaleToFit(in: rect.size)
        let targetSize = size * scale
        let center = rect.center
        let origin = center.originPoint(for: targetSize)
        return .init(origin: origin, size: targetSize)
    }
    
    /**
     Returns the rect that fills the given rect
     
     - parameter rect: The rect to fit into
     - returns: The scaled rect that fills the given rect
     */
    func scaleToFill(_ rect: CGRect) -> CGRect {
        let scale = size.scaleToFill(rect.size)
        let targetSize = size * scale
        let center = rect.center
        let origin = center.originPoint(for: targetSize)
        return .init(origin: origin, size: targetSize)
    }
}
#endif
