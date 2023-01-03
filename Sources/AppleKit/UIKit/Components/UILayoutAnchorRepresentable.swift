//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

#if canImport(UIKit)
public protocol UILayoutAnchorRepresentable {
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

extension UIView: UILayoutAnchorRepresentable {}
extension UILayoutGuide: UILayoutAnchorRepresentable {}
#endif
