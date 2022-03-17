//
//  CollectionViewSource.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

#if canImport(UIKit)
extension Collection {
    func unfoldSubSequences(limitedTo maxLength: Int) -> UnfoldSequence<SubSequence,Index> {
        sequence(state: startIndex) { start in
            guard start < self.endIndex else { return nil }
            let end = self.index(start, offsetBy: maxLength, limitedBy: self.endIndex) ?? self.endIndex
            defer { start = end }
            return self[start..<end]
        }
    }
}

open class ReusableDataSource: NSObject {
    
    open var layout: ReusableLayout
    open var sections: [ReusableSection]
    
    public init(layout: ReusableLayout = ReusableLayout(), sections: [ReusableSection] = []) {
        self.layout = layout
        self.sections = sections
        
        super.init()
    }
    
    public convenience init(layout: ReusableLayout = ReusableLayout(), _ sections: [[ReusableItemProtocol]]) {
        let sections = sections.map { ReusableSection(items: $0) }
        self.init(layout: layout, sections: sections)
    }
    
    // MARK: - item helpers
    
    public func layout(at index: Int) -> ReusableLayout {
        section(at: index).layout ?? layout
    }

    public func section(at index: Int) -> ReusableSection {
        sections.element(at: index)!
    }
    
    public func item(at indexPath: IndexPath) -> ReusableItemProtocol {
        section(at: indexPath.section).items.element(at: indexPath.item)!
    }

    // MARK: - view registration
    
    public func registerItems(_ collectionView: UICollectionView) {
    
        let lll = UICollectionViewCompositionalLayout { [unowned self] section, environment in
            let curr = sections[section]
            let currLayout = curr.layout ?? layout
            let height: CGFloat = 44
                        
            let itms = curr.items.enumerated().map { (idx, i) -> NSCollectionLayoutItem in
                let s = i.size(environment: environment)
                let x: CGFloat = 1 / CGFloat(currLayout.columns)
                let w = s.width ?? .fractionalWidth(x)
                let h = s.height ?? .estimated(height)
                let itemSize = NSCollectionLayoutSize(widthDimension: w, heightDimension: h)
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: s.width ?? .fractionalWidth(1), heightDimension: .estimated(height))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: s.width == nil ? currLayout.columns : 1)
                group.interItemSpacing = .fixed(currLayout.padding)
                if s.width != nil {
                    if idx == 0 {
                        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: currLayout.padding)
                    }
                    if idx == curr.items.count - 1 {
                        group.contentInsets = .init(top: 0, leading: currLayout.padding, bottom: 0, trailing: 0)
                    }
                }
                return group
            }

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(height))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: itms)
            let section = NSCollectionLayoutSection(group: group)
        
            var supp: [NSCollectionLayoutBoundarySupplementaryItem] = []
            if let h = curr.header {
                let s = h.size(environment: environment)
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: s.width ?? .fractionalWidth(1),
                                                                                           heightDimension: s.height ?? .estimated(90)),
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
                header.pinToVisibleBounds = false
                header.zIndex = Int.max
                supp.append(header)
            }
            
            if let f = curr.footer {
                let s = f.size(environment: environment)
                let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: s.width ?? .fractionalWidth(1),
                                                                                           heightDimension: s.height ?? .estimated(90)),
                                                                         elementKind: UICollectionView.elementKindSectionFooter,
                                                                         alignment: .bottom)
                supp.append(footer)
            }

            
            section.interGroupSpacing = currLayout.padding
            section.contentInsets = .init(top: currLayout.margin,
                                          leading: currLayout.margin,
                                          bottom: currLayout.margin,
                                          trailing: currLayout.margin)
            section.boundarySupplementaryItems = supp
            
            section.orthogonalScrollingBehavior = currLayout.scrollingBehavior
            
            return section

        }
        
        collectionView.collectionViewLayout = lll
        collectionView.contentInset = .init(top: layout.margin, left: 0, bottom: 0, right: 0)
        
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "UICollectionReusableView")
        
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: "UICollectionReusableView")
        
        for section in sections {
            if let cell = section.header?.reusableViewType {
                collectionView.register(cell, UICollectionView.elementKindSectionHeader)
            }
            if let cell = section.footer?.reusableViewType {
                collectionView.register(cell, UICollectionView.elementKindSectionFooter)
            }

            for cell in section.items.map({ $0.reusableViewType }) {
                collectionView.register(cell)
            }
        }
        
    }
}

extension ReusableDataSource: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection index: Int) -> Int {
        section(at: index).items.count
    }
        
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = item(at: indexPath)
        let reusableViewType = collectionView.reuse(viewModel.reusableViewType, indexPath)
        
        viewModel.config(reusableViewType: reusableViewType,
                         collectionView: collectionView,
                         indexPath: indexPath)

        return reusableViewType as! UICollectionViewCell
    }
   
    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        let section = section(at: indexPath.section)
        
        var reusableItem: ReusableItemProtocol?
        if kind == UICollectionView.elementKindSectionHeader {
            reusableItem = section.header
        }
        if kind == UICollectionView.elementKindSectionFooter {
            reusableItem = section.footer
        }
        guard let reusableItem = reusableItem else {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: "UICollectionReusableView",
                                                                   for: indexPath)
        }
        let reusableViewType = collectionView.reuse(reusableItem.reusableViewType, indexPath, kind)
        reusableItem.config(reusableViewType: reusableViewType, collectionView: collectionView, indexPath: indexPath)
        return reusableViewType
    }
}

extension ReusableDataSource: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        let reusableItem = item(at: indexPath)
        reusableItem.select(collectionView: collectionView, indexPath: indexPath)
    }
}

extension ReusableDataSource: UICollectionViewDelegateFlowLayout {

//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.item == 0 {
//            return .init(width: 80, height: 80)
//            print(UICollectionViewFlowLayout.automaticSize.width)
//        }
//        let layout = layout(at: indexPath.section)
//        let reusableItem = item(at: indexPath)
//        return reusableItem.size(collectionView: collectionView, indexPath: indexPath, layout: layout)
////        print(UICollectionViewFlowLayout.automaticSize)
////        return .zero
//        return UICollectionViewFlowLayout.automaticSize
//    }
////
//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .zero
////        layout(at: section).margin
//    }
//
//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        layout(at: section).verticalPadding
//        return .zero
//    }
//
//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        layout(at: section).horizontalPadding
//        return .zero
//    }
//
//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               referenceSizeForHeaderInSection index: Int) -> CGSize {
//        let section = section(at: index)
//        let layout = layout(at: index)
//        let indexPath = IndexPath(item: -1, section: index)
//        return section.header?.size(collectionView: collectionView, indexPath: indexPath, layout: layout) ?? .zero
//    }
//
//    public func collectionView(_ collectionView: UICollectionView,
//                               layout collectionViewLayout: UICollectionViewLayout,
//                               referenceSizeForFooterInSection index: Int) -> CGSize {
//        let section = section(at: index)
//        let layout = layout(at: index)
//        let indexPath = IndexPath(item: -1, section: index)
//        return section.footer?.size(collectionView: collectionView, indexPath: indexPath, layout: layout) ?? .zero
//    }
}
#endif
