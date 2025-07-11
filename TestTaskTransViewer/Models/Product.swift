//
//  Product.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct Product {
    var name: String
    var transactions: [Transaction]
    
    init(name: String, transactions: [Transaction]) {
        self.name = name
        self.transactions = transactions
    }
}
