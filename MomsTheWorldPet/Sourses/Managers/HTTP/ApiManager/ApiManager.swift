//
//  ApiManager.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.05.2023.
//

import Foundation

protocol APIManagerProtocol {
    func makeRequest<T: Codable>(
        for endpoint: Endpoint, completion: @escaping (APIResult<T>) -> Void)
    func uploadFile<T: Codable>(
        for endpoint: Endpoint,
        fileParameter: FileParameter, completion: @escaping (APIResult<T>) -> Void)
}

final class APIManager: APIManagerProtocol {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }

    func makeRequest<T: Codable>(for endpoint: Endpoint, completion: @escaping (APIResult<T>) -> Void) {
        guard let request = endpoint.urlRequest else {
            completion(.failure(APIError.networkError))
            return
        }
        
        print(request)

        networkManager.sendRequest(request, completion: completion)
    }
    
    func uploadFile<T: Codable>(for endpoint: Endpoint, fileParameter: FileParameter, completion: @escaping (APIResult<T>) -> Void) {
        guard let request = endpoint.urlRequest else {
            completion(.failure(APIError.networkError))
            return
        }
        
        
        
        let formData = MultipartFormDataBuilder.buildFormData(with: nil, files: [fileParameter])
        networkManager.sendMultipartFormData(request, formData: formData, completion: completion)
    }
}
