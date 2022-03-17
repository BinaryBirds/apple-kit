//
//  UIView+Id.swift
//  CollectionView
//
//  Created by Tibor Bödecs on 2019. 04. 25..
//

#if canImport(UIKit)
extension UICollectionReusableView {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }
}

extension UICollectionView {
    
    func register<T: UICollectionReusableView>(_ type: T.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_ type: T.Type, _ kind: String) {
        register(type, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.reuseIdentifier)
    }
    
    func reuse<T: UICollectionReusableView>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
    
    func reuse<T: UICollectionReusableView>(_ type: T.Type, _ indexPath: IndexPath, _ kind: String) -> T {
        dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
}
#endif
