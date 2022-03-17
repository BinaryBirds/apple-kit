//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 16..
//


public extension AppleColor {

    func brightness(_ percent: CGFloat, lighter: Bool) -> AppleColor {
        let v = hsba
        var newBrightness = max(v.b * percent, 0.0)
        if lighter {
            newBrightness = min(v.b * percent, 1.0)
        }
        return AppleColor(hue: v.h, saturation: v.s, brightness: newBrightness, alpha: v.a)
    }

    func lighterColor(percent: CGFloat = 1.25) -> AppleColor {
        brightness(percent, lighter: true)
    }

    func darkerColor(percent: CGFloat = 0.75) -> AppleColor {
        brightness(percent, lighter: false)
    }

    var isDarkColor: Bool {
        lumens < 0.5
    }

    var isBlackOrWhite: Bool {
        let v = self.rgba

        if v.r > 0.91 && v.g > 0.91 && v.b > 0.91 {
            return true //white
        }
        if v.r < 0.09 && v.g < 0.09 && v.b < 0.09 {
            return true //black
        }

        return false
    }

    func set(alpha: CGFloat) -> AppleColor {
        withAlphaComponent(alpha)
    }

    func set(hue: CGFloat) -> AppleColor {
        let v = hsba
        return AppleColor(hue: hue, saturation: v.s, brightness: v.b, alpha: v.a)
    }

    func set(saturation: CGFloat) -> AppleColor {
        let v = hsba
        return AppleColor(hue: v.h, saturation: saturation, brightness: v.b, alpha: v.a)
    }

    func set(brightness: CGFloat) -> AppleColor {
        let v = hsba
        return AppleColor(hue: v.h, saturation: v.s, brightness: brightness, alpha: v.a)
    }

    func isDistinct(color: AppleColor, threshold: CGFloat = 0.25) -> Bool {
        let rgba1 = rgba
        let rgba2 = color.rgba

        if  abs(rgba1.r - rgba2.r) > threshold ||
            abs(rgba1.g - rgba2.g) > threshold ||
            abs(rgba1.b - rgba2.b) > threshold ||
            abs(rgba1.a - rgba2.a) > threshold {
            // check for grays, prevent multiple gray colors
            if  abs(rgba1.r - rgba1.g) < 0.03 &&
                abs(rgba1.r - rgba1.b) < 0.03 &&
                abs(rgba2.r - rgba2.g) < 0.03 &&
                abs(rgba2.r - rgba2.b) < 0.03 {
                return false
            }
            return true
        }
        return false
    }

    func isContrasting(color: AppleColor) -> Bool {
        let bLum = lumens
        let fLum = color.lumens

        var contrast: CGFloat = 0.0

        if bLum > fLum {
            contrast = (bLum + 0.05) / (fLum + 0.05)
        }
        else {
            contrast = (fLum + 0.05) / (bLum + 0.05)
        }
        //return contrast > 3.0; //3-4.5 W3C recommends 3:1 ratio, but that filters too many colors
        return contrast > 1.6
    }

}

