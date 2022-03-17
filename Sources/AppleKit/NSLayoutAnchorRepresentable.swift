//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

public protocol NSLayoutAnchorRepresentable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension AppleView: NSLayoutAnchorRepresentable {}

#if canImport(UIKit)
extension UILayoutGuide: NSLayoutAnchorRepresentable {}
#endif

#if canImport(AppKit)
extension NSLayoutGuide: NSLayoutAnchorRepresentable {}
#endif

