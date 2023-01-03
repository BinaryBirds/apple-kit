//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
public extension UIViewController {
    /**
     Adds a view controller as a child
     
     - parameter viewController: The view controller
     - parameter toView:         The view to add the view controller's view (default: self.view)
     */
    func addChild(viewController: UIViewController, to destination: UIView? = nil) {
        let view: UIView = destination ?? view
        addChild(viewController)
        viewController.willMove(toParent: self)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    /**
     Removes a view controller from the hierarchy
     */
    func removeFromParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
#endif
