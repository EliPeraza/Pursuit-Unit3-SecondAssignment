//
//  ImageHelper.swift
//  StarWarsApp
//
//  Created by Elizabeth Peraza  on 12/26/18.
//  Copyright © 2018 Elizabeth Peraza . All rights reserved.
//

import UIKit

final class ImageHelper {

  static func fetchImage(urlString: String, completionHandler: @escaping (AppError?, UIImage?) -> Void) {
    NetworkHelper.performanceDataTask(urlString: urlString, httpMethod: "GET") { (error, data, response) in
      if let error =  error {
        completionHandler(error, nil)
      } else if let data = data {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
          completionHandler(nil, image)
        }
      }
    }
  }
  
}
