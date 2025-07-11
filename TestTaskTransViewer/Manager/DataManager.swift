//
//  DataManager.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

final class DataManager {
    
    static func fetchAllTransaction(completion: @escaping ([Transaction]) -> ()) {
        if let path = Bundle.main.path(forResource: "transactions", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path) {
            let decoder = PropertyListDecoder()
            do {
                let transDTOs = try decoder.decode([TransactionDTO].self, from: data)
                let transactions = transDTOs.map { Transaction.init(dto: $0) }
                completion(transactions)
            } catch {
                print("Error decoding transactions plist: \(error)")
            }
        } else {
            print("Error path plist")
        }
    }
    
    static func fetchAllRates(completion: @escaping ([Rate]) -> ()) {
        if let path = Bundle.main.path(forResource: "rates", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path) {
            let decoder = PropertyListDecoder()
            do {
                let ratesDTOs = try decoder.decode([RateDTO].self, from: data)
                let rates = ratesDTOs.map { Rate.init(dto: $0) }
                completion(rates)
            } catch {
                print("Error decoding rates plist: \(error)")
            }
        } else {
            print("Error path  plist")
        }
    }
}
