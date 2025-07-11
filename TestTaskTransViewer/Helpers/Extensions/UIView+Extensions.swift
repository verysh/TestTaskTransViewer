//
//  UIView+Extensions.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach() { view in
            self.addSubviewForAutolayout(view)
        }
    }
    
    private func addSubviewForAutolayout(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
