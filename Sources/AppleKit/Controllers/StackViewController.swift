//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2022. 01. 29..
//

open class StackViewController: ViewController {
    
    weak var scrollView: ScrollView!
    weak var stackView: StackView!
    
    #if canImport(UIKit)
    open override func loadView() {
        super.loadView()
        
        let scrollView = ScrollView()
        view.addSubview(scrollView)
        self.scrollView = scrollView
        NSLayoutConstraint.activate(scrollView.fillAnchors(view.safeAreaLayoutGuide))

        let stackView = StackView(.vertical)
        scrollView.addSubview(stackView)
        self.stackView = stackView
        NSLayoutConstraint.activate(stackView.fillAnchors(scrollView, constant: 16))
        NSLayoutConstraint.activate([stackView.widthAnchor(scrollView, constant: -32)])
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        reload()
    }

    open func reload() {
        stackView.setArragnedSubviews(stackViews())
    }
    #endif
    
    @AppleViewBuilder
    open func stackViews() -> [AppleView] {
        
    }
}

