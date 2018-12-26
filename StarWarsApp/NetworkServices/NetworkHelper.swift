//
//  NetworkHelper.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation

final class NetworkHelper {
  static func performanceDataTask(urlString: String, httpMethod: String, completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) -> Void) {
    guard let url = URL(string: urlString) else {
      completionHandler(AppError.badURL("\(urlString)"), nil, nil)
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod

    if let cachedResponsed = URLCache.shared.cachedResponse(for: request) {
      completionHandler(nil, cachedResponsed.data, cachedResponsed.response as? HTTPURLResponse)
    } else {
      URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let response = response as? HTTPURLResponse else {
          completionHandler(AppError.noResponse, nil, nil)
          return
        }
        print("reponse status code is \(response.statusCode)")
        if let error = error {
          completionHandler(AppError.networkingError(error), nil, response)
        } else if let data = data {
          completionHandler(nil, data, response)
        }
        } .resume()
    }
  }
}

