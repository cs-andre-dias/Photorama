//
//  PhotoStore.swift
//  Photorama
//
//  Created by Andre Dias on 25/10/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation

class PhotoStore {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    
    func fetchRecentPhotos() {
        
        let url = FlickrApi.recentPhotosURL()
        let request = NSURLRequest(url: url as URL)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData, encoding:  String.Encoding.utf8.rawValue) {
                    print("ola teste \(jsonString)")
                }
            }else if let requestError = error {
                print("Error fetching recent photos \(requestError)")
            }else{
                print("unexpected error with the request")
            }
        }
        task.resume()
    }
}
