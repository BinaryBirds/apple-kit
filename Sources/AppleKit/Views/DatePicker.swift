//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

#if canImport(UIKit)
open class DatePicker: UIDatePicker {

    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("not available")
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
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
#endif
