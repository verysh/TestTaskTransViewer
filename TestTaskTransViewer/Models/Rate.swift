//
//  Rate.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

struct Rate {
    let from: String
    let to: String
    let rate: String
    
    init(dto: RateDTO) {
        self.from = dto.from
        self.to = dto.to
        self.rate = dto.rate
    }
}
