//
//  Transaction.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct Transaction {
    var amount: String
    var currency: String
    var sku: String
    
    init(dto: TransactionDTO) {
        self.amount = dto.amount
        self.currency = dto.currency
        self.sku = dto.sku
    }
}
