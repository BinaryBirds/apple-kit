//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

#if canImport(UIKit)
@resultBuilder
public enum NSLayoutConstraintBuilder {
    
    public static func buildBlock(_ components: NSLayoutConstraint...) -> [NSLayoutConstraint] {
        components
    }

    public static func buildBlock(_ components: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        expression
    }

    public static func buildExpression(_ expression: NSLayoutConstraint) -> [NSLayoutConstraint] {
        [expression]
    }
}




public protocol SubviewLoadable {
    
    @NSLayoutConstraintBuilder
    func subviewConstraints() -> [NSLayoutConstraint]
}

public extension SubviewLoadable {

    func subviewConstraints() -> [NSLayoutConstraint] {
        []
    }
}

public extension SubviewLoadable where Self: UIView {

    func loadSubview<T: UIView>(_ keyPath: ReferenceWritableKeyPath<Self, T?>) {
        let subview = T()
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        self[keyPath: keyPath] = subview
    }
}

public extension SubviewLoadable where Self: UIViewController {

    func loadSubview<T: UIView>(_ keyPath: ReferenceWritableKeyPath<Self, T?>) {
        let subview = T()
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(subview)
        self[keyPath: keyPath] = subview
    }
}

extension UIView: SubviewLoadable {}
extension UIViewController: SubviewLoadable {}
#endif
