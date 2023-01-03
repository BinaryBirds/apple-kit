//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(UIKit)
open class CollectionView: UICollectionView {
    
    public init(layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)

        initialize()
    }

    @available(*, unavailable)
    private override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
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
