//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)

open class TabBarController: AppleTabBarController {

    // MARK: - unavailable init
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) is not available")
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) is not available")
    }
    
    // MARK: - init
    
    public init() {
        super.init(nibName: nil, bundle: nil)

        self.initialize()
    }
    
    open func initialize() {
        
    }

    
    #if os(iOS)
    

    open override var shouldAutorotate: Bool {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.shouldAutorotate
        }
        return super.shouldAutorotate
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }

    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let viewController = self.viewControllers?[self.selectedIndex] {
            return viewController.preferredStatusBarStyle
        }
        return super.preferredStatusBarStyle
    }
    #endif

}
#endif
