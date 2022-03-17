//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

#if canImport(UIKit)
open class NavigationController: AppleNavigationController {

    // MARK: - init
    
    public init() {
        #if os(iOS)
        super.init(navigationBarClass: AppleNavigationBar.self, toolbarClass: AppleToolbar.self)
        #endif
        #if os(tvOS)
        super.init(navigationBarClass: AppleNavigationBar.self, toolbarClass: nil)
        #endif
        self.initialize()
    }
    
    public convenience init(_ rootViewController: AppleViewController) {
        self.init(rootViewController: rootViewController)
    }

    public override init(rootViewController: AppleViewController) {
        #if os(iOS)
        super.init(navigationBarClass: AppleNavigationBar.self, toolbarClass: AppleToolbar.self)
        #endif
        #if os(tvOS)
        super.init(navigationBarClass: AppleNavigationBar.self, toolbarClass: nil)
        #endif
        self.viewControllers = [rootViewController]

        self.initialize()
    }

    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.initialize()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    open func initialize() {

    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        #if os(iOS)
        self.interactivePopGestureRecognizer?.delegate = self
        #endif
    }

    #if os(iOS)
    override open var shouldAutorotate: Bool {
        if let shouldRotate = self.topViewController?.shouldAutorotate {
            return shouldRotate
        }
        return super.shouldAutorotate
    }

    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let orientation = self.topViewController?.supportedInterfaceOrientations {
            return orientation
        }
        return super.supportedInterfaceOrientations
    }

    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let orientation = self.topViewController?.preferredInterfaceOrientationForPresentation {
            return orientation
        }
        return super.preferredInterfaceOrientationForPresentation
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        if let style = self.topViewController?.preferredStatusBarStyle {
            return style
        }
        return super.preferredStatusBarStyle
    }
    #endif

}

#if os(iOS)
extension NavigationController: UIGestureRecognizerDelegate {

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
#endif
#endif
