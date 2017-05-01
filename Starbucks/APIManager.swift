//
//  APIManager.swift
//  Starbucks
//
//  Created by Naina Sai Tipparti on 4/24/17.
//  Copyright © 2017 Naina Sai Tipparti. All rights reserved.
//

import UIKit
import GoogleMaps

private var _sharedInstanceAPI:APIManger! = APIManger()

class APIManger: NSObject {
    
    // MARK: - Shared Instance
    
    class var sharedInstance : APIManger {
        return _sharedInstanceAPI
    }
    
    // MARK: - Initialization Method
    
    override init() {
        super.init()
    }
    
    
    func getResults(location: CLLocation, completionhandler:@escaping (_ response:NSDictionary)->Void) {
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let types = "cafe"
        let name = "Starbucks"
        let radius = "150"
        let key = "AIzaSyBXdqeaH1-wKsW9pdMrR5DDx32jZqPJnKI"
        let urlPath = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?" +
            "location=\(latitude),\(longitude)" +
            "&radius=" + radius +
            "&key=" + key +
            "&types=" + types +
            "&name=" + name
        let urlString: String! = urlPath
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let url = URL(string: urlString)!
        
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
//                        print(json)
                        completionhandler(json as NSDictionary)
                        
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
        
        
        
    }
    
}





