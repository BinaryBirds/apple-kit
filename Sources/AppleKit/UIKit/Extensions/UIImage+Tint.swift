//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
public extension UIImage {

    func tint(color: UIColor) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: rect)
        let context = UIGraphicsGetCurrentContext()!
        context.setBlendMode(.sourceIn)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
#endif
