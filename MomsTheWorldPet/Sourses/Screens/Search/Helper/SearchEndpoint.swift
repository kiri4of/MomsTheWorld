//
//  SearchEndpoint.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.05.2023.
//

import Foundation
import Alamofire

enum SearchEndpoint {
    case searchCity(searchText: String)
   
}

extension SearchEndpoint: Endpoint {
    var baseURL: URL {
        return URL(string: "https://data-api.oxilor.com")!
    }
    
    var path: String {
        switch self {
        case .searchCity:
            return "/rest/search-regions"
        }
    }
    
    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .searchCity:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .searchCity:
            return ["Authorization":"Bearer" + " " + ApiKeySearch.key]
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .searchCity(let searchText):
            return [
                "searchTerm":searchText,
                "first":15,
                "type":"city",
                "countryCode":"US"]
        }
    }
    
    var encoding: Alamofire.ParameterEncoding {
        switch self {
        case .searchCity:
            return URLEncoding.default
        }
    }
}

enum ApiKeySearch {
    static let key = "GBIiy5yREzRcpoUKi8O5sO5Xvwtm_I"
}
