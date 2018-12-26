//
//  StarWarsDataBaseAPI.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation

final class StarWarsDataBaseAPI {
  
  static func getMovieInfo (keyword:String, completionHandler: @escaping (AppError?, [StarWarsMovies]?) -> Void) {
    let urlString = "https://swapi.co/api/\(keyword)/"
    
    guard let url = URL(string: urlString) else {
      completionHandler(AppError.badURL("malformatted URL"), nil)
      return
    }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completionHandler(AppError.networkingError(error), nil)
      } else if let data = data {
        do {
          let searchData = try JSONDecoder().decode(StarWarsMovies.MovieInfo.self, from: data)
          
          completionHandler(nil, searchData.results)
        } catch {
          completionHandler(AppError.decodingError(error), nil)
        }
      }
      }.resume()
    
  }
}




//NetworkHelper.performanceDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
//  if let error = error {
//    completionHandler(error, nil)
//  } else if let data = data {
//    do {
//      let movieData = try JSONDecoder().decode(StarWarsMovies.self, from: data)
//      completionHandler(nil, movieData.results)
//    } catch {
//      completionHandler(AppError.decodingError(error), nil)
//    }
//  }
//}
