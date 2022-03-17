//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class Label: AppleLabel {
    
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
        
    }
    
    public func numberOfLines(_ value: Int) -> Self {
        numberOfLines = value
        return self
    }
    
}
#endif
