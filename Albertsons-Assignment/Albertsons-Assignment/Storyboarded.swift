//
//  Storyboarded.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController  {
    static func instantiate() -> Self {
        let classFullName = NSStringFromClass(self)
        let className = classFullName.components(separatedBy: ".")[1]
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: className) as! Self
    }
}
