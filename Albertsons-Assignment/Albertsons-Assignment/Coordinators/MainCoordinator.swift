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
    var navigationController: UINavigationController
    var network = NetworkRequests()
    var meowFactResposne: FactResponse?
    var kittenResponse: Data?
    var viewModel: ViewModel?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController.instantiate()
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            let group = DispatchGroup()
            group.enter()
            self.network.makeMeowFactsRequest { [weak self] (result: Result<FactResponse, Error>) in
                group.leave()
                switch result {
                case .success(let data):
                    self?.meowFactResposne = data
                case .failure(let error):
                    print(error)
                }
            }
            group.enter()
            self.network.makeKittenRequest { [weak self] (data) in
                group.leave()
                guard let data = data else {
                    print("Error!! Problem downloading the image")
                    return
                }
                self?.kittenResponse = data
            }
            group.wait()
            DispatchQueue.main.async {
                self.viewModel = ViewModel(fact: self.meowFactResposne?.getFact(), imageData: self.kittenResponse)
                viewController.viewModel = self.viewModel
            }
        }
        _ = viewController.view
        viewController.coordinator = self
        self.navigationController.pushViewController(viewController, animated: false)

    }
}
