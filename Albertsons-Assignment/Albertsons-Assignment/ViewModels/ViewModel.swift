//
//  ViewModel.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import Foundation

struct ViewModel {
    var fact: String?
    var imageData: Data?
    
    init(fact: String?, imageData: Data?) {
        self.fact = fact
        self.imageData = imageData
    }
}


