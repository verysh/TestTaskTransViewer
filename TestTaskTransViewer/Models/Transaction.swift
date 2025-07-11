//
//  Transaction.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct Transaction: Decodable {
    var amount: String
    var currency: String
    var sku: String
}
