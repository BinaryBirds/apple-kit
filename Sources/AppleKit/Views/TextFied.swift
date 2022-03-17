//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class TextField: UITextField {
    
    @available(*, unavailable)
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(_ id: String, value: String? = nil, placeholder: String? = nil) {
        super.init(frame: .zero)
        
        self.id = id
        self.text = value
        self.placeholder = placeholder
        backgroundColor = .secondarySystemBackground
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        layer.cornerRadius = 15
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always

        self.initialize()
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

#endif
