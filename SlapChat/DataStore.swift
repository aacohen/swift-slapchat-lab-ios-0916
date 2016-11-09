//
//  DataStore.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
    static let sharedInstance = DataStore()
    
    var messages = [Message] ()
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "slapChat")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() {
        let managedContext = persistentContainer.viewContext
        let request = NSFetchRequest<Message>(entityName: "Message")
//       alternate way to do fetch request: 
//       let fetchTwo: NSFetchRequest<Message> = Message.fetchRequest()
        
        do { let data = try managedContext.fetch(request)
            messages = data
            let sortedMessages = messages.sorted(by: { (message1, message2) -> Bool in
                
//                another way to do this: force casting as Date allows you to not use .compare AND takes away the optional but if messageA.createdAt is nil then it will crash when forcing as Date
                
//                var dateA = messageA.createdAt as! Date
//                var dateB = messageB.createdAt as! Date
//                
//                return dateA > dateB
                
                return message1.createdAt.compare(message2.createdAt as Date) == .orderedDescending
                
            })
            messages = sortedMessages
        } catch {
            print("error")
        }
        
       
    }
    
}
