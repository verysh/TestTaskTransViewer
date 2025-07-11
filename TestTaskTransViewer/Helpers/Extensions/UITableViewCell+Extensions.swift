//
//  UITableViewCell+Extensions.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

extension UITableViewCell {
    class var reuseId: String { return String(describing: self) }
}
