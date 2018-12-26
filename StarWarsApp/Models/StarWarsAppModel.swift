//
//  StarWarsAppModel.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct StarWarsMovies: Codable {
  
  struct MovieInfo: Codable {
    let results:[StarWarsMovies]
  }
  
  
  let title: String
  let episode_id: Int?
  let opening_crawl: String?
  let director: String
  let release_date: String?
  let url: String
}

//private enum CodingKeys: String, CodingKey {
//  case title
//  case episodeID = "episode_id"
//  case openingCrawl = "opening_crawl"
//  case director
////  case releaseDate = "release_date"
//  case url
//
//}
