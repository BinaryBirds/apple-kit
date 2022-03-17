//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class ImageView: AppleImageView {
    
    @available(*, unavailable)
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) is not available")
    }
   
    public init() {
        super.init(frame: .zero)
        self.initialize()
    }

//    public init() {
//        super.init(frame: .zero)
//
//        let img = AppleImage(named: name)!
//        image = img
//
//        heightAnchor.constraint(equalTo: widthAnchor, multiplier: img.size.height / img.size.width).isActive = true
//
////        layer.cornerRadius = 15
////        clipsToBounds = true
//        self.initialize()
//    }
//
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false   
    }
}
