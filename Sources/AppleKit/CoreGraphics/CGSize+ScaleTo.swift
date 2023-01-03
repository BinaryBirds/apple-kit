//
//  CGSize+ScaleTo.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 20..
//

#if canImport(CoreGraphics)
public extension CGSize {

    /**
     Returns the scale to fit into a given size
     
     - parameter size: The size to fit into
     - returns: The calculated scale
     */
    func scaleToFit(in size: CGSize) -> CGFloat {
        precondition(!hasZeroComponent && !size.hasZeroComponent, "Can't scale using zero component.")
        guard size != self else {
            return 1
        }
        return min(size.width / width, size.height / height)
    }
    
    /**
     Returns the scale to fill a given size
     
     - parameter size: The size to fill
     - returns: The calculated scale
     */
    func scaleToFill(_ size: CGSize) -> CGFloat {
        precondition(!hasZeroComponent && !size.hasZeroComponent, "Can't scale using zero component.")
        guard size != self else {
            return 1
        }
        return max(size.width / width, size.height / height)
    }
}
#endif
