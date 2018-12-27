//
//  AdditionalInfoViewController.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/17/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import UIKit

class AdditionalInfoViewController: UIViewController {
  
  public var movie: StarWarsMovies!
  
  
  @IBOutlet weak var moviePoster: UIImageView!
  
  @IBOutlet weak var introText: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDetailedView()
  }
  
  func setDetailedView() {
    introText.text = movie.opening_crawl
  }
  
  
}
