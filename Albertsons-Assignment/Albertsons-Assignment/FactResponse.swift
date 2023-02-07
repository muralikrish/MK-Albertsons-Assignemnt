//
//  FactResponse.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/7/23.
//

import Foundation

struct FactResponse: Decodable {
    let facts: [String]
    
    enum CodingKeys: String, CodingKey {
        case facts = "data"
    }
    
    func getFact() -> String {
        guard let fact = self.facts.first else {
            return "Error!! Random fact unavailable."
        }
        return fact
    }
}
