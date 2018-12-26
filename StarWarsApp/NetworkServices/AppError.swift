//
//  AppError.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation


enum AppError: Error{
  case badURL(String)
  case networkingError(Error)
  case noResponse
  case decodingError(Error)
  
  
  public func errorMessage() -> String {
    switch self{
    case .badURL(let str):
      return "Bad URL: \(str)"
    case .networkingError(let error):
      return "Network error: \(error)"
    case .noResponse:
      return "No network response"
    case .decodingError(let error):
      return "Decoding error: \(error)"
    }
  }
  
}
