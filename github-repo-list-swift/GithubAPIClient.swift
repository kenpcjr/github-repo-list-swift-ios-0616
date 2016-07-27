//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completionHandler: (retrievedData: NSArray) -> ()){
        
        let newSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let urlToGet = NSURL(string: "https://api.github.com/repositories?client_id=f03e0bed47d234464b52&client_secret=6e774a2c231d18802868fffc64af19c1ca67f96e") {
            
            let newTask = newSession.dataTaskWithURL(urlToGet) { (data, response, error) in
                
                if let data = data {
                    
                    do {
                        
                        let retrievedData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                        
                        completionHandler(retrievedData: retrievedData)
                        
                    } catch {
                        
                        print("Error creating data dictionary")
                        
                    }
                    
                }
                
            }
            
            newTask.resume()
            
        }
        
    }
    
}

