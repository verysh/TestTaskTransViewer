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
                let transactions = try decoder.decode([Transaction].self, from: data)
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
                let rates = try decoder.decode([Rate].self, from: data)
                completion(rates)
            } catch {
                print("Error decoding rates plist: \(error)")
            }
        } else {
            print("Error path  plist")
        }
    }
}
