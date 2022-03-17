//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

#if canImport(UIKit)
open class CollectionView: UICollectionView {

    public convenience init() {
        self.init(layout: UICollectionViewFlowLayout())
    }

    public init(layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.initialize()
    }
    
    @available(*, unavailable)
    private override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        fatalError("init(frame:collectionViewLayout) is not available")
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) is not available")
    }
    
    open func initialize() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
#endif
