//
//  LoadingViewWrapper.swift
//  Indoor-Navigation
//
//  Created by Andreea Miculescu on 18.06.2023.
//

import UIKit
import Foundation

class LoadingWrapperView: UIView {
    private let loadingView = LoadingView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSubviews()
    }
    
    private func configureSubviews() {
        // Configure the loadingView's layout, constraints, and appearance
        addSubview(loadingView)
        // ... Additional configuration if needed
    }
}

// Usage:
func showLoadingView() {
    let loadingWrapperView = LoadingWrapperView(frame: view.bounds)
    view.addSubview(loadingWrapperView)
}

// Rest of the code...
