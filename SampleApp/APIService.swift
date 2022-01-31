//
//  APIService.swift
//  SampleApp
//
//  Created by Dhaval Rajani on 31/01/22.
//

import Foundation

struct MyCustomError: Error {
  var message: String?
}

final class APIService<T: Decodable> {
  static func getComments(path: String, resultType: T.Type, completionHandler: @escaping (Result<[T], MyCustomError>) -> Void) {
    var urlComponents = URLComponents()
    urlComponents.scheme = "http"
    urlComponents.host = "mocki.io"
    urlComponents.path = "/v1/55a8c3e1-e9db-46d3-bb2e-7746c0514ca1"
    
    
    let requestUrl = urlComponents.url!
    
    URLSession.shared.dataTask(with: requestUrl) { data, responseData, error in
      guard (error == nil) else {
        completionHandler(.failure(MyCustomError(message: error?.localizedDescription)))
        return
      }
      
      guard let statusCode = (responseData as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
        completionHandler(.failure(MyCustomError(message: "Something went wrong!! with statuscode \((responseData as? HTTPURLResponse)?.statusCode ?? 0)")))
        return
      }
      
      guard let data = data else {
        completionHandler(.failure(MyCustomError(message: "Something went wrong!!")))
        return
      }
      
      
      do {
        let jsonData = try JSONDecoder().decode([T].self, from: data)
        completionHandler(.success(jsonData))
      } catch let error {
        completionHandler(.failure(MyCustomError(message: "Something wrong with JSON parser \(error.localizedDescription)")))
      }
    }.resume()
  }
  
  
}
