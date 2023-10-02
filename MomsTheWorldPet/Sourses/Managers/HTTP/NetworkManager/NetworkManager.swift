//
//  NetworkManager.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.05.2023.
//

import Foundation
import Alamofire

enum APIError: Error {
    case serverError(message: String)
    case networkError
}

enum APIResult<T> {
    case success(T)
    case failure(APIError)
}

protocol NetworkManagerProtocol {
    func sendRequest<T: Decodable>(_ request: URLRequestConvertible, completion: @escaping (APIResult<T>) -> Void)
    func sendMultipartFormData<T: Decodable>(_ request: URLRequestConvertible, formData: MultipartFormData, completion: @escaping (APIResult<T>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    func sendRequest<T: Decodable>(_ request: URLRequestConvertible, completion: @escaping (APIResult<T>) -> Void) {
        AF.request(request).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                debugPrint(error)
                let apiError = APIError.networkError
                completion(.failure(apiError))
            }
        }
    }
    
    func sendMultipartFormData<T: Decodable>(_ request: URLRequestConvertible, formData: MultipartFormData, completion: @escaping (APIResult<T>) -> Void) {
        AF.upload(multipartFormData: formData, with: request).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(_):
                let apiError = APIError.networkError
                completion(.failure(apiError))
            }
        }
    }
}
