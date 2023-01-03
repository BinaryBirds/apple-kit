//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 03..
//

open class ViewController: AppleViewController {
    
#if canImport(AppKit)
    private var observer: NSKeyValueObservation?
#endif

    public init() {
        super.init(nibName: nil, bundle: nil)
        
        initialize()
     
#if canImport(AppKit)
        observer = NSApp.observe(\.effectiveAppearance) { [self] _, _ in
            viewControllerDidChangeEffectiveAppearance()
        }
#endif
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    deinit {
#if canImport(AppKit)
        observer?.invalidate()
        observer = nil
#endif
    }
    
    open func initialize() {
        
    }

#if canImport(UIKit)
    @available(*, unavailable)
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("unavailable")
    }
#endif

#if canImport(AppKit)
    @available(*, unavailable)
    private override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        fatalError("unavailable")
    }
    
    open func loadMainView() {
        view = View()
    }
    
    open override func loadView() {
        loadMainView()
    }
    
    func viewControllerDidChangeEffectiveAppearance() {
        
    }
#endif
}
