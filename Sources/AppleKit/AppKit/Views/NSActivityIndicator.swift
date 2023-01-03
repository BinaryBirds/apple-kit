//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class NSActivityIndicatorView: NSProgressIndicator {
    
    public var hidesWhenStopped: Bool {
        get { !isDisplayedWhenStopped }
        set { isDisplayedWhenStopped = !newValue }
    }
}


open class ActivityIndicator: NSActivityIndicatorView {

    public init() {
        super.init(frame: .zero)

        isIndeterminate = true
        style = .spinning
        isDisplayedWhenStopped = false
        
        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("unavailable")
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }    
}
#endif
