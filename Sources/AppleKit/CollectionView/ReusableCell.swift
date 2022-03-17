//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 02..
//

#if canImport(UIKit)
open class ReusableCell<View: UIView>: CollectionViewCell {
    
    weak var view: View!

    open override func initialize() {
        super.initialize()

        let view = View()
        contentView.addSubview(view)
        self.view = view
        
        NSLayoutConstraint.activate(view.fillAnchors(contentView))
    }
}
#endif
