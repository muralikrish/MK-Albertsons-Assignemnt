//
//  MainCoordinator.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController?
    var network = NetworkRequests()
    var meowFactResposne: FactResponse?
    var kittenResponse: Data?
    var viewModel: ViewModel?
    let group = DispatchGroup()
    var viewController: ViewController
    
    init(navigationController: UINavigationController?, viewController:ViewController = ViewController.instantiate()) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    func start() {
        self.viewController.coordinator = self
        self.navigationController?.pushViewController(viewController, animated: false)
        retrieveDataAndUpdate()
    }
    
    func retrieveDataAndUpdate(){
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            self.group.enter()
            self.makeMeowFactsRequest()
            self.group.enter()
            self.makeKittenImageRequest()
            self.group.wait() // Waiting for both the requests to finish to create ViewModel.
            DispatchQueue.main.async {
                ///Creating viewModel and passing to viewController
                self.viewModel = ViewModel(fact: self.meowFactResposne?.getFact(), imageData: self.kittenResponse)
                self.viewController.viewModel = self.viewModel
            }
        }
    }
    
    func makeMeowFactsRequest() {
        self.network.makeMeowFactsRequest { [weak self] (result: Result<FactResponse, Error>) in
            self?.group.leave() //Indicating the makeMeowFactsRequest has completed.
            switch result {
            case .success(let data):
                self?.meowFactResposne = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func makeKittenImageRequest() {
        self.network.makeKittenImageRequest { [weak self] (data) in
            self?.group.leave() //Indicating the makeKittenImageRequest has completed.
            guard let data = data else {
                print("Error!! Problem downloading the image")
                return
            }
            self?.kittenResponse = data
        }
    }
}
