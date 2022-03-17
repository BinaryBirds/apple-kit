//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class TextView: UITextView {
    
    @available(*, unavailable)
    private override init(frame: CGRect, textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(id: String) {
        super.init(frame: .zero, textContainer: nil)
        
        self.id = id
        
        self.initialize()
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 15
        textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        font = UIFont.preferredFont(forTextStyle: .body)
        
        heightAnchor.constraint(equalToConstant: 132).isActive = true
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


#endif
