//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        print("PRint Text")
        
        store.fetchData()
        tableView.reloadData()
        
//        if store.messages.isEmpty {
////            generateTestData()
//        }
//            
        
        
        print("\(store.messages.count) in viewdidload")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
   
        store.fetchData()
        //updates local messages
        tableView.reloadData()
    }
   
    
//    func generateTestData() {
//        let newMessage1 = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
//        
//        newMessage1.content = "This is Message Number 1"
//        newMessage1.createdAt = NSDate()
//        let newMessage2 = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
//        newMessage2.content = "This is Message number 2"
//        newMessage2.createdAt = NSDate()
// print()
//        store.saveContext()
//        store.fetchData()
//        tableView.reloadData()
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) 
        cell.textLabel?.text = store.messages[indexPath.row].content
        return cell
    }
    
    
    
}
