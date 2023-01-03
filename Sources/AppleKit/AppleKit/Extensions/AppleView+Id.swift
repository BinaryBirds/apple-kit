//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

public extension AppleView {

    var id: String? {
        get {
            accessibilityIdentifier
        }
        set {
            accessibilityIdentifier = newValue
        }
    }

    func get<T>(_ id: String, as type: T.Type) -> T? where T: AppleView {
        get(id) as? T
    }

    func get(_ id: String) -> AppleView? {
        if self.id == id {
            return self
        }
        for view in subviews {
            if let view = view.get(id) {
                return view
            }
        }
        return nil
    }
}
