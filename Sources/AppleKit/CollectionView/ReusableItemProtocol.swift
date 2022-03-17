//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 05..
//

#if canImport(UIKit)
public protocol ReusableItemProtocol {
    var viewType: UIView.Type { get }
    var reusableViewType: UICollectionReusableView.Type { get }
    
    func config(reusableViewType: UICollectionReusableView, collectionView: UICollectionView, indexPath: IndexPath)
    func size(environment: NSCollectionLayoutEnvironment) -> (width: NSCollectionLayoutDimension?, height: NSCollectionLayoutDimension?)
    func select(collectionView: UICollectionView, indexPath: IndexPath)
}
#endif
