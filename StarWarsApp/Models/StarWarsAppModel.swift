//
//  StarWarsAppModel.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct StarWarsMovies: Codable {

  let results:[MovieInfo]
  
}

struct MovieInfo: Codable {
  let title: String
  let episodeID: Int
  let epeningCrawl: String
  let director: String
  let releaseDate: String
  let url: String
}

private enum CodingKeys: String, CodingKey {
  
  case episodeID = "episode_id"
  case epeningCrawl = "opening_crawl"
  case releaseDate = "release_date"
  
}
