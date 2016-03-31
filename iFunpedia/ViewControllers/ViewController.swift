//
//  ViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 29/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,APIManagerDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    let apiManager:APIManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
        print(countryCode)
        
        apiManager.delegate = self
        apiManager.getAllBooks(["countryCode":countryCode])
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: "ReachabilityStatusChanged", object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reachabilityChanged(note: NSNotification) {
        
        switch reachabilityStatus {
        case "Cellular":
            print(reachabilityStatus)
            CommonFunctions.showStatus(UIColor.greenColor())
            
        case "WiFi":
            print(reachabilityStatus)
            CommonFunctions.showStatus(UIColor.greenColor())
            
        case "No Connection":
            print(reachabilityStatus)
            CommonFunctions.showStatus(UIColor.redColor())
        default:
            print(reachabilityStatus)
            
        }
    }
    
    
    func didGetAllAudioBooksSuccess(manager: APIManager) {
        print(manager.data!)
    }
    
    func didFailedToGetAllBooks(manager: APIManager) {
        print(manager.err!.localizedDescription)
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
        cell.textLabel?.text = "Audio Books"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "type" {
            
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        let cell:UITableViewCell = sender as! UITableViewCell
        let indexPath:NSIndexPath = self.tableview.indexPathForCell(cell)!
        if indexPath.row == 0 {
            return false
        }
        return true
    }
    
}

