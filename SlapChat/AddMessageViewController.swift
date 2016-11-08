//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Ariela Cohen on 11/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {
    
    let store = DataStore.sharedInstance

   
    @IBOutlet weak var textField: UITextField!
    @IBAction func saveButton(_ sender: AnyObject) {
     
       let message =  NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.persistentContainer.viewContext) as! Message
        message.content = textField.text!
       message.createdAt = NSDate()
        store.saveContext()
        self.dismiss(animated: true, completion: nil)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
