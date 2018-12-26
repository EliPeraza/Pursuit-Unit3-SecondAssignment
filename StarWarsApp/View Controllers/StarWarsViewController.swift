//
//  StarWarsViewController.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/17/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {

  
  @IBOutlet weak var starWarsTableView: UITableView!
  
  private var starWarsMovies = [StarWarsMovies]() {
    didSet {
      DispatchQueue.main.async {
        self.starWarsTableView.reloadData()
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      starWarsTableView.dataSource = self
      starWarsTableView.delegate = self 
      getMovieData()
      dump(starWarsMovies)

    }
  
  func getMovieData() {
    StarWarsDataBaseAPI.getMovieInfo(keyword: "films") { (error, data) in
      DispatchQueue.main.async {
        if let error = error {
         print(error)
        }
        if let data = data {
         self.starWarsMovies = data
        }
      }
    }
  }

 

}

extension StarWarsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return starWarsMovies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "SWCell", for: indexPath) as? StarwarsCustomCell else {return UITableViewCell()}
    
    let currentEpisode = starWarsMovies[indexPath.row]
    cell.titleSWCell.text = currentEpisode.title
    cell.releaseYear.text = "Released on: " + currentEpisode.release_date!
    return cell
  }
  
}

extension StarWarsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}


