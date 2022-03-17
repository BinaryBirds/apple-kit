//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

public extension NSLayoutConstraint {

    func activate() {
        isActive = true
    }

    func deactivate() {
        isActive = false
    }

    @discardableResult
    func activated() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}

