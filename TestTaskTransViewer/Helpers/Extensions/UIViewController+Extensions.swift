//
//  UIViewController+Extensions.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

extension UIViewController {
    func setupNavigationBarTitle(_ title: String) {
        navigationItem.title = title
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
