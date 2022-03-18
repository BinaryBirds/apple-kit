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
        
        initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init() {
        super.init(frame: .zero)

        initialize()
    }
    
    convenience init(_ id: String, value: String? = nil, placeholder: String? = nil) {
        self.init()
        
        self.id = id
        self.text = value
        self.placeholder = placeholder
    }
    
    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = .secondarySystemBackground
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        layer.cornerRadius = 15
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
    }
}

#endif
