//
//  Array+Element.swift
//  CoreKit
//
//  Created by Tibor Bodecs on 2022. 02. 02..
//

public extension Array {
    
    /**
     Returns an element of the array if the index is valid
     
     - parameter index: The index of the element
     - returns: The element or `nil` if the index is out of bounds
     */
    func element(at index: Int) -> Element? {
        index < count && index >= 0 ? self[index] : nil
    }
}
