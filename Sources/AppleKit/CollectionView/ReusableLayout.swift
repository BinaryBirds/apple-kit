//
//  Grid.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

#if canImport(UIKit)
open class ReusableLayout {
    
    open var columns: Int
    open var margin: CGFloat
    open var padding: CGFloat
    open var scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior
    
    public init(columns: Int = 1,
                margin: CGFloat = 20,
                padding: CGFloat = 20,
                scrollingBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none) {
        self.columns = columns
        self.margin = margin
        self.padding = padding
        self.scrollingBehavior = scrollingBehavior
    }
}
#endif
