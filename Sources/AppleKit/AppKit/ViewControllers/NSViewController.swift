//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(AppKit)
open class ViewController: NSViewController {
    
    var observer: NSKeyValueObservation?
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        initialize()

        observer = NSApp.observe(\.effectiveAppearance) { [self] _, _ in
            viewControllerDidChangeEffectiveAppearance()
        }
    }

    deinit {
        observer?.invalidate()
        observer = nil
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    @available(*, unavailable)
    public override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        fatalError("unavailable")
    }

    open func initialize() {

    }

    open func loadMainView() {
        view = View()
    }

    open override func loadView() {
        loadMainView()
    }
    
    func viewControllerDidChangeEffectiveAppearance() {
        
    }
}
#endif
