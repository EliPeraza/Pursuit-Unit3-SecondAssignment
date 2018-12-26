//
//  StarWarsDataBaseAPI.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation

final class StarWarsDataBaseAPI {
  
  static func getMovieInfo (keyword:String, completionHandler: @escaping (AppError?, ([MovieInfo]?)) -> Void) {
    let urlString = "https://swapi.co/api/films/"
    
    
    NetworkHelper.performanceDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
      if let error = error {
        completionHandler(error, nil)
      } else if let data = data {
        do {
          let movieData = try JSONDecoder().decode(StarWarsMovies.self, from: data)
          completionHandler(nil, movieData.results)
        } catch {
          completionHandler(AppError.decodingError(error), nil)
        }
      }
    }
    
  }
  
  
}
