//
//  FlickrApi.swift
//  Photorama
//
//  Created by Andre Dias on 25/10/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

struct FlickrApi {
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIKey = "a​6​d​8​1​9​4​9​9​1​3​1​0​7​1​f​1​5​8​f​d​7​4​0​8​6​0​a​5​a​8​8​"
    
    private static func flickrURL(method: Method, parameters: [String: String]?) -> NSURL{
        let components = NSURLComponents(string: baseURLString)!
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
            "method" : method.rawValue,
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key" : APIKey
        ]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems as [URLQueryItem]?
        
        return components.url! as NSURL
        
    }
    
    static func recentPhotosURL() -> NSURL{
        return flickrURL(method: .RecentPhotos, parameters: ["extras": "url_h,date_taken"])
    }
    
}
