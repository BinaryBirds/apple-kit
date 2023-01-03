//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class CollectionViewCell: NSCollectionViewItem {
   
    public override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        initialize()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }
    
    open func initialize() {
        
    }
}
#endif
