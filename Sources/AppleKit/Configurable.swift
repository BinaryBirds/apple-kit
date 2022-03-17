//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

public protocol Configurable {}

public extension Configurable {

    func config(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
