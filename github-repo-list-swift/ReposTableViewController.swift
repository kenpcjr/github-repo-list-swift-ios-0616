//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let dataStore = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        dataStore.getRepositoriesWithCompletion {
            NSOperationQueue.mainQueue().addOperationWithBlock{
                
                self.tableView.reloadData()
                print("test")
            }
        }
        
        print(dataStore.repositories.count)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("The TableView Sees \(dataStore.repositories.count)")
        
        return dataStore.repositories.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = dataStore.repositories[indexPath.row].fullName as String
        
        print(cell.textLabel?.text)
        
        return cell
    }
    
    
}
