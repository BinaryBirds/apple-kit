//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class CollectionView: NSCollectionView {
    
    public init(layout: NSCollectionViewLayout) {
        super.init(frame: .zero)

        collectionViewLayout = layout

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
