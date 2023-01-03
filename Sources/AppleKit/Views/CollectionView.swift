//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

import Foundation

open class CollectionView: AppleCollectionView {
    
    public init(layout: AppleCollectionViewLayout) {
#if canImport(AppKit)
        super.init(frame: .zero)
        collectionViewLayout = layout
#endif
        
#if canImport(UIKit)
        super.init(frame: .zero, collectionViewLayout: layout)
#endif
        initialize()
    }

#if canImport(AppKit)
    @available(*, unavailable)
    private override init(frame: CGRect) {
        fatalError("unavailable")
    }
#endif

#if canImport(UIKit)
    @available(*, unavailable)
    private override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        fatalError("unavailable")
    }
#endif

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
