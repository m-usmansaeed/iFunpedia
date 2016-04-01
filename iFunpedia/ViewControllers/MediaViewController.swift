//
//  ViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 29/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit
import Alamofire


class MediaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableview: UITableView!
    
    var mediaArray:AnyArray = AnyArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaArray =  storageData["Media"] as! AnyArray
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: "ReachabilityStatusChanged", object: nil)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
        let media:Dict = mediaArray[forRowAtIndexPath.row] as! Dict
        
        cell.textLabel?.text = media["mediaName"] as? String
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        let media:Dict = mediaArray[selectedIndex.row] as! Dict
        
        if segue.identifier == "type" {
            
            let vc = segue.destinationViewController as! TypesViewController
            vc.types = media["types"] as! AnyArray
        }
    }
    
}

