//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class TextField: UITextField {
    
    var editingChangeHandler: ((TextField) -> Void)?
    var editingDidEndOnExitHandler: ((TextField) -> Void)?
    var doneHandler: ((TextField) -> Void)?
    
    public var value: String { text ?? "" }
    public var isEmpty: Bool { value.isEmpty }
    
    // MARK: - init
    
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
        
        self.addTarget(self, action: #selector(editingChangedAction(_:)), for: .editingChanged)
        self.addTarget(self, action: #selector(editingDidEndOnExitAction(_:)), for: .editingDidEndOnExit)
    }
    
    // MARK: - actions
    
    @objc private func editingChangedAction(_ sender: Any) {
        self.editingChangeHandler?(self)
    }

    @objc private func editingDidEndOnExitAction(_ sender: Any) {
        self.editingDidEndOnExitHandler?(self)
    }

    @objc private func doneAction(_ sender: Any) {
        self.doneHandler?(self)
    }

    @discardableResult
    public func onEditingChange(_ handler: @escaping ((TextField) -> Void)) -> Self {
        self.editingChangeHandler = handler
        return self
    }
    
    @discardableResult
    public func onEditingDidEndOnExit(_ handler: @escaping ((TextField) -> Void)) -> Self {
        self.editingDidEndOnExitHandler = handler
        return self
    }

    @discardableResult
    public func onDone(_ handler: @escaping ((TextField) -> Void)) -> Self {
        self.doneHandler = handler
        return self
    }
}

#endif
