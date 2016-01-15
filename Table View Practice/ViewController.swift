//
//  ViewController.swift
//  Table View Practice
//
//  Created by JScharm on 1/13/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

// Bring in data source and delegate protocalls for tableView
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    var superHeros = ["Batman", "Superman", "Aquaman", "Wonder Woman", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Diana", "Barry Allen", "Peter Parker"]

    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        
        // Set tableView datasource and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
 
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
        
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Super Hero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextfield) -> Void in
            nameTextfield.placeholder = "Add Super Hero Name Here" 
        }
        myAlert.addTextFieldWithConfigurationHandler { (ailasTextfield) -> Void in
            ailasTextfield.placeholder = "Add Super Hero Name Here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superHeroTF = myAlert.textFields![0] as UITextField
            let ailasTextfield = myAlert.textFields![1] as UITextField
            self.superHeros.append(superHeroTF.text!)
            self.realNames.append(ailasTextfield.text!)
            self.myTableView.reloadData()
            
        }
        myAlert.addAction(addAction)
        
        // Present alert view
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
    
    // Required function for table view protocall- Sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Create a cell variable for tableView
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        // Sets properties of the cell 
        myCell.textLabel!.text = superHeros[indexPath.row]
        myCell.detailTextLabel?.text = realNames[indexPath.row]
        return myCell
    }
    
    // Required fucntion for table view protocall- Sets number of frows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superHeros.count
    }
    
    // Allows you to delete a row from your tablevView
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superHeros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            // Reloads tableView
            myTableView.reloadData()
        }
    }
    
    // Allows to move rows
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let superHero = superHeros[sourceIndexPath.row]
        superHeros.removeAtIndex(sourceIndexPath.row)
        superHeros.insert(superHero, atIndex: destinationIndexPath.row)
        
        let ailas = realNames[sourceIndexPath.row]
        realNames.removeAtIndex(sourceIndexPath.row)
        realNames.insert(ailas, atIndex: destinationIndexPath.row)
    }

}

