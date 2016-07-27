//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    
    let fullName: NSString
    let htmlURL: NSURL
    let repositoryID: NSString
    
    init(dictionary: NSDictionary) {
        
        self.fullName = dictionary["full_name"] as! NSString
        let URLString = dictionary["html_url"] as! String
        self.htmlURL = NSURL.init(string: URLString)!
        let IDNumber = dictionary["id"] as! NSNumber
        self.repositoryID = "\(IDNumber)" as NSString
        
        
        //print("Repo Initialized as: Name: \(self.fullName), URL: \(self.htmlURL), ID: \(repositoryID)")
        
    }
    
}
