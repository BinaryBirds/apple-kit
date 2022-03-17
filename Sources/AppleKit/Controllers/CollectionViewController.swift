//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 02. 03..
//

#if canImport(UIKit)
open class CollectionViewController: ViewController {
    
    open weak var collectionView: ReusableCollectionView!
      
    open func subviewConstraints() -> [NSLayoutConstraint] {
        collectionView.verticalAnchors(view) + collectionView.horizontalAnchors(view.safeAreaLayoutGuide)
    }
    
    // MARK: - view controller
    
    open override func loadView() {
        super.loadView()
        
        view.addSubview(UIView(frame: .zero))
        
        loadSubview(\.collectionView)
        NSLayoutConstraint.activate(subviewConstraints())
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = true
    }
    
    // MARK: - handle autorotation
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard
            collectionView != nil,
            let previousTraitCollection = previousTraitCollection,
            traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
            traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass
        else {
            return
        }
        
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    open override func viewWillTransition(to size: CGSize,
                                          with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        guard collectionView != nil else {
            return
        }
        
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.bounds.size = size
        
        coordinator.animate(alongsideTransition: { context in
            context.viewController(forKey: UITransitionContextViewControllerKey.from)
            
        }, completion: { [weak self] _ in
            self?.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
}
#endif
