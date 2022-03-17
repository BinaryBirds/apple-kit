//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class ViewController: AppleViewController {

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    public init() {
        super.init(nibName: nil, bundle: nil)

        self.initialize()
    }

    #if canImport(UIKit)
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.initialize()
    }
    
    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        if self.isViewLoaded && self.view.window == nil {

        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }

    @objc 
    open func back() {
        _ = self.navigationController?.popViewController(animated: true)
    }

    @objc
    open func close() {
        self.dismiss(animated: true, completion: nil)
    }
    #endif
    
    #if canImport(AppKit)
    @available(*, unavailable)
    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.initialize()
    }
    #endif

    open func initialize() {

    }

    deinit {

    }

    #if os(iOS)
    open override var shouldAutorotate: Bool {
        false
    }

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .portrait
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    #endif
}

