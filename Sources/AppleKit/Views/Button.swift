//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//


open class Button: AppleButton {
    
    @available(*, unavailable)
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    public init() {
        super.init(frame: .zero)

        self.initialize()
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false

        #if canImport(UIKit)
        self.addTarget(self, action: #selector(self.touchAction(_:)), for: .touchUpInside)
        #endif
    }
    
    var touchHandler: ((AppleButton) -> Void)?
    
    @objc func touchAction(_ sender: AppleButton) {
        self.touchHandler?(sender)
    }
    
    public func onTouch(_ handler: @escaping ((AppleButton) -> Void)) -> Self {
        self.touchHandler = handler
        return self
    }
}
