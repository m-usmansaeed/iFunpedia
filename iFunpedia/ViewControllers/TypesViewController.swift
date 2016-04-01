//
//  TypesViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

class TypesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var types:AnyArray = AnyArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
        
        let type = types[forRowAtIndexPath.row] as! Dict
        cell.textLabel?.text = type["typeName"] as? String
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        let type:Dict = types[selectedIndex.row] as! Dict
        
        if segue.identifier == "genre" {
            
            let vc = segue.destinationViewController as! GenreViewController
            vc.typeDict = type
        }
    }

    
    @IBAction func btnBack(sender: AnyObject) {
    
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    
    
}
