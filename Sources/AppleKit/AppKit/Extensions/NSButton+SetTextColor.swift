//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSButton {

    func setTextColor(_ color: NSColor) {
        let attributedString = attributedTitle.mutableCopy() as! NSMutableAttributedString
        let range = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedTitle = attributedString
    }
}
#endif
