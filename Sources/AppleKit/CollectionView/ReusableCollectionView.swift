//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 02..
//

#if canImport(UIKit)
open class ReusableCollectionView: CollectionView {

    open var reusableDataSource: ReusableDataSource? = nil {
        didSet {
            self.reusableDataSource?.registerItems(self)

            self.dataSource = self.reusableDataSource
            self.delegate = self.reusableDataSource
        }
    }
}
#endif
