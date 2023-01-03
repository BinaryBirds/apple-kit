//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 16..
//

public extension AppleImage {

    var averageColor: AppleColor {
        let rgba = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let info = CGImageAlphaInfo.premultipliedLast.rawValue
        let context = CGContext(data: rgba,
                                width: 1,
                                height: 1,
                                bitsPerComponent: 8,
                                bytesPerRow: 4,
                                space: colorSpace,
                                bitmapInfo: info)!

        context.draw(cgImage!, in: CGRect(origin: .zero, size: .init(width: 1, height: 1)))

        if rgba[3] > 0 {
            let alpha: CGFloat = CGFloat(rgba[3]) / 255.0
            let multiplier: CGFloat = alpha / 255.0

            return AppleColor(red: CGFloat(rgba[0]) * multiplier,
                              green: CGFloat(rgba[1]) * multiplier,
                              blue: CGFloat(rgba[2]) * multiplier,
                              alpha: alpha)

        }
        return AppleColor(red: CGFloat(rgba[0]) / 255.0,
                          green: CGFloat(rgba[1]) / 255.0,
                          blue: CGFloat(rgba[2]) / 255.0,
                          alpha: CGFloat(rgba[3]) / 255.0)
    }
}
