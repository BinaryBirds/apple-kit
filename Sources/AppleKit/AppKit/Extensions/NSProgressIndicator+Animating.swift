//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
public extension NSProgressIndicator {

    func startAnimating() {
        startAnimation(nil)
    }

    func stopAnimating() {
        stopAnimation(nil)
    }
}
#endif
