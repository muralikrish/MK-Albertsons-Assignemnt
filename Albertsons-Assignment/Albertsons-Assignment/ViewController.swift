//
//  ViewController.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import UIKit

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
    
    func setUp() {
        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        self.view.addGestureRecognizer(tapGesture)
        self.navigationItem.title = "Cats Information"
    }
    
    func updateUI() {
        self.fact.text = viewModel?.fact
        self.imageView.image = UIImage(data: (viewModel?.imageData)!)
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        print("did tap view", sender)
        coordinator?.retrieveDataAndUpdate()
    }
}

