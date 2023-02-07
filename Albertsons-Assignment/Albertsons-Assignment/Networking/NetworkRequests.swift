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
    func makeKittenImageRequest(completion: @escaping (Data?) -> Void)
}

/// Providing default implementation for the protocol methods
extension NetworkRequesting {
    /// generic method to make API get request.
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
    
    ///This method downloads the image data from the URL.
    func downloadDataWithUrl(with url: String, completion: @escaping (Data?) -> Void) {
        AF.request(url)
            .response { response in
                completion(response.data)
            }
    }
}

class NetworkRequests: NetworkRequesting {
    /// This method makes API request to fetch the facts data about Cats.
    func makeMeowFactsRequest(completion: @escaping (Result<FactResponse, Error>) -> Void) {
        self.makeRequestWithUrl(with: URLs.meowFacts) { (result: Result<FactResponse, Error>) in
            completion(result)
        }
    }
    
    /// This method makes API Request to fetch the Cat image data
    func makeKittenImageRequest(completion: @escaping (Data?) -> Void) {
        let width = Int.random(in: 100...500) // Generating a random number.
        let height = Int.random(in: 100...600)
        // https://placekitten.com/\(width)/\(height)
        let placeKittenUrl = URLs.placeKitten + "\(width)/\(height)" // Framing complete URL by appending image size in URL.
        self.downloadDataWithUrl(with: placeKittenUrl) { (data) in
            completion(data)
        }
    }
    
}

