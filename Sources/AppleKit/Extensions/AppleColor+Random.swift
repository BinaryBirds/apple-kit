//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 16..
//

public extension AppleColor {

    /**
     Generates a random color using arc4random with hsl generation
     
     - returns: The random color object
     */
    static var random: AppleColor {
        return AppleColor.randomHSBColor
    }

    /**
     Generates a random color using arc4random with hsl generation
     
     - returns: The random color object
     */
    static var randomHSBColor: AppleColor {
        let hue = fmod(CGFloat.random(in: 0..<1), 256) / 256
        let saturation = fmod(CGFloat.random(in: 0..<1), 128) / 256 + 0.5
        let brightness = fmod(CGFloat.random(in: 0..<1), 128) / 256 + 0.5
        return AppleColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }

    /**
     Generates a random color using drand48 with rgb generation
     
     - returns: The random color object
     */
    static var randomRGBColor: AppleColor {
        let red = CGFloat.random(in: 0..<1)
        let green = CGFloat.random(in: 0..<1)
        let blue = CGFloat.random(in: 0..<1)
        return AppleColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
