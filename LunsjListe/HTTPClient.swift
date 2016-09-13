//
//  HTTPClient.swift
//  Nabohjelp
//
//  Created by Anders Ullnæss on 01/09/16.
//  Copyright © 2016 Anders Ullnæss. All rights reserved.
//

import Foundation

enum HTTPError: Error {
    case NetworkError
}

typealias HTTPResult = (Data?, Error?) -> Void

class HTTPClient {
    private let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    func get(url: URL, token: String, completion: HTTPResult) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.setValue(token, forHTTPHeaderField: Constants.Headers.authorization)
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
           self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
    
    func post(url: URL, headers: [String: String], completion: HTTPResult) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 10.0
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        task.resume()
    }
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: HTTPResult) {
        if error != nil  {
            //Logger.printDebug(error?.localizedDescription)
            completion(nil, HTTPError.NetworkError)
        } else if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
            completion(data, nil)
        } else {
            completion(nil, HTTPError.NetworkError)
        }
    }
}
