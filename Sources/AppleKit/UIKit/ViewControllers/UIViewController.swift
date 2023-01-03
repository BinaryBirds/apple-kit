//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2023. 01. 02..
//

#if canImport(UIKit)
open class ViewController: UIViewController {

    public init() {
        super.init(nibName: nil, bundle: nil)

        initialize()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("unavailable")
    }

    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("unavailable")
    }

    open func initialize() {

    }
}
#endif
