//
//  ViewModel.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import Foundation

struct ViewModel {
    let fact: String?
    let imageData: Data?
    init(fact: String?, imageData: Data?) {
        self.fact = fact
        self.imageData = imageData
    }
}
    
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

