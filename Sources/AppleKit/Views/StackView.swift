//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class StackView: AppleStackView {
    
    @available(*, unavailable)
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(_ axis: AppleStackViewAxis = .vertical, @AppleViewBuilder _ views: () -> [AppleView]) {
        super.init(frame: .zero)
        #if canImport(AppKit)
        self.orientation = axis
        #endif
        #if canImport(UIKit)
        self.axis = axis
        #endif

        self.initialize()
        
        for view in views() {
            addArrangedSubview(view)
        }
    }

    public convenience init(_ axis: AppleStackViewAxis = .vertical) {
        self.init(axis, {})
    }
    
    func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.distribution = .fill
        self.spacing = 16
        
        #if canImport(UIKit)
        self.alignment = .fill
        #endif
    }

    func config(_ block: (StackView) -> Void) -> StackView {
        block(self)
        return self
    }
}

public extension StackView {
    
    func removeArrangedSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
            NSLayoutConstraint.deactivate(view.constraints)
            view.removeFromSuperview()
        }
    }
    
    func addArrangedSubviews(_ views: [AppleView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }

    func setArragnedSubviews(_ views: [AppleView]) {
        removeArrangedSubviews()
        addArrangedSubviews(views)
    }
}
