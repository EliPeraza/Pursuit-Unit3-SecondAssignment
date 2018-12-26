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
  
  var starWarsMovies = [MovieInfo]() {
    didSet {
      DispatchQueue.main.async {
        self.starWarsTableView.reloadData()
      }
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      dump(starWarsMovies)
      starWarsTableView.dataSource = self
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
    
    return cell
  }
  
}


