//
//  MultipartBuilder.swift
//  Mum’s the word
//
//  Created by Kiri4of on 25.05.2023.
//

import Alamofire
import Foundation

struct MultipartFormDataBuilder {
    static func buildFormData(with parameters: [String: Any]?, files: [FileParameter]?) -> MultipartFormData {
        let formData = MultipartFormData()
        
        if let parameters = parameters {
            for (key, value) in parameters {
                if let stringValue = value as? String {
                    appendStringFormData(formData: formData, value: stringValue, key: key)
                } else if let intValue = value as? Int {
                    appendStringFormData(formData: formData, value: String(intValue), key: key)
                } else if let fileUrl = value as? URL {
                    appendFileFormData(formData: formData, fileUrl: fileUrl, key: key)
                }
            }
        }
        
        if let files = files {
            for file in files {
                appendFileFormData(formData: formData, fileData: file.data, key: file.name, fileName: file.fileName, mimeType: file.mimeType)
            }
        }
        
        return formData
    }
    
    private static func appendStringFormData(formData: MultipartFormData, value: String, key: String) {
        formData.append(value.data(using: .utf8)!, withName: key)
    }
    
    private static func appendFileFormData(formData: MultipartFormData, fileUrl: URL, key: String) {
        let fileName = fileUrl.lastPathComponent
        formData.append(fileUrl, withName: key, fileName: fileName, mimeType: "application/octet-stream")
    }
    
    private static func appendFileFormData(formData: MultipartFormData, fileData: Data, key: String, fileName: String, mimeType: String) {
        formData.append(fileData, withName: key, fileName: fileName, mimeType: mimeType)
    }
}

struct FileParameter {
    let name: String
    let fileName: String
    let mimeType: String
    let data: Data
}
