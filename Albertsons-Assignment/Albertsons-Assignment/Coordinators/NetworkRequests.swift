//
//  NetworkRequests.swift
//  Albertsons-Assignment
//
//  Created by MURALIKRISHNA VEERAMOSU on 2/5/23.
//

import Foundation
import Combine
import Alamofire

struct URLs {
    static let meowFacts = "https://meowfacts.herokuapp.com/"
    static let placeKitten = "http://placekitten.com/"
}

protocol NetworkRequesting {
    func makeRequestWithUrl<T:Decodable>(with url:String, completion: @escaping (Result<T, Error>) -> Void)
    func downloadDataWithUrl(with url: String, completion: @escaping (Data?) -> Void)
    func makeMeowFactsRequest(completion: @escaping (Result<FactResponse, Error>) -> Void)
    func makeKittenRequest(completion: @escaping (Data?) -> Void)
}

extension NetworkRequesting {
    func makeRequestWithUrl<T:Decodable>(with url:String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: T.self) { (response) in
                switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func downloadDataWithUrl(with url: String, completion: @escaping (Data?) -> Void) {
        AF.request(url)
            .response { response in
                completion(response.data)
            }
    }
}


class NetworkRequests: NetworkRequesting {
    
    func makeMeowFactsRequest(completion: @escaping (Result<FactResponse, Error>) -> Void) {
        self.makeRequestWithUrl(with: URLs.meowFacts) { (result: Result<FactResponse, Error>) in
            completion(result)
        }
    }
    
    func makeKittenRequest(completion: @escaping (Data?) -> Void) {
        let width = Int.random(in: 100...500)
        let height = Int.random(in: 100...600)
       // https://placekitten.com/\(width)/\(height)
        let placeKittenUrl = URLs.placeKitten + "\(width)/\(height)"
        self.downloadDataWithUrl(with: placeKittenUrl) { (data) in
            completion(data)
        }
    }

}

