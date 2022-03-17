//
//  CollectionViewViewModel.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

#if canImport(UIKit)
open class ReusableItem<View, Model>: ReusableItemProtocol where View: UIView, Model: Any {

    
    public typealias SelectionHandler = ((Model) -> Void)
    public typealias ConfigHandler = ((View, Model) -> Void)
    public typealias SizeHandler = ((NSCollectionLayoutEnvironment) -> (width: NSCollectionLayoutDimension?, height: NSCollectionLayoutDimension?))

    open var model: Model
    open var viewType: UIView.Type { return View.self }
    open var reusableViewType: UICollectionReusableView.Type { ReusableCell<View>.self }
    
    var configHandler: ConfigHandler?
    var selectionHandler: SelectionHandler?
    var sizeHandler: SizeHandler?

    public init(_ model: Model, _ handler: ConfigHandler? = nil) {
        self.model = model
        self.configHandler = handler

        initialize()
    }
    
    open func initialize() {
        
    }

    open func config(_ view: View, _ model: Model) {
        configHandler?(view, model)
    }
    
    public func size(_ handler: @escaping SizeHandler) -> Self {
        sizeHandler = handler
        return self
    }
    
    public func onSelect(_ handler: @escaping SelectionHandler) -> Self {
        selectionHandler = handler
        return self
    }
    
    // MARK: - protocol
    
    open func config(reusableViewType: UICollectionReusableView,
                     collectionView: UICollectionView,
                     indexPath: IndexPath) {
        let cell = reusableViewType as! ReusableCell<View>
        config(cell.view, model)
    }
    
    open func size(environment: NSCollectionLayoutEnvironment) -> (width: NSCollectionLayoutDimension?, height: NSCollectionLayoutDimension?) {
        sizeHandler?(environment) ?? (width: nil, height: nil)
    }
    
    open func select(collectionView: UICollectionView, indexPath: IndexPath) {
        selectionHandler?(model)
    }
}
#endif
