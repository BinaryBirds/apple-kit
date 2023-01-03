//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(AppKit)
public extension NSViewController {
    /**
     Adds a view controller as a child
     
     - parameter viewController: The view controller
     - parameter toView:         The view to add the view controller's view (default: self.view)
     */
    func addChild(viewController: NSViewController, to destination: NSView? = nil) {
        let view: NSView = destination ?? view
        addChild(viewController)
        view.addSubview(viewController.view)
    }

    /**
     Removes a view controller from the hierarchy
     */
    func removeFromParentViewController() {
        view.removeFromSuperview()
        removeFromParent()
    }
}
#endif
