//
//  RateDTO.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct RateDTO: Decodable, Equatable {
    let from: String
    let to: String
    let rate: String
}
