//
//  RepoBase.swift
//  Medusa
//
//  Created by felipecambas on 5/5/23.
//

import Foundation

enum httpMethods {
    case post
    case get
    case put
    case delete
}

enum NetworkError: Error {
    case transportError(Error)	
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}


class RepoBase {
     
    func makeRequest(json : Data, url : String, method : httpMethods, completion: @escaping (Result<Data, NetworkError>) -> Void) async{
        
        let url_ = URL(string: url)!
        var request = URLRequest(url: url_)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        switch(method){
        case .post : request.httpMethod = "POST"
        case .get : request.httpMethod = "GET"
        case .delete : request.httpMethod = "DELETE"
        case .put : request.httpMethod = "PUT"
        }
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: json)
            completion(.success(data))
        } catch(let exception) {
            print("Exception: \(exception.localizedDescription)")
        }
        
    }
    
}
