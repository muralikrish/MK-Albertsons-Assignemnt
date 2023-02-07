//
//  ViewController.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fact: UILabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    var viewModel: ViewModel? {
        didSet {
            updateUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setUp() {
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func updateUI() {
            self.fact.text = self.viewModel?.fact
            self.imageView.image = UIImage(data: (self.viewModel?.imageData)!)
    }
    
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        
    }
}
