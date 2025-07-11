//
//  TransactionDTO.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct TransactionDTO: Decodable, Hashable {
    var amount: String
    var currency: String
    var sku: String
}
