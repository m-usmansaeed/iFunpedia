//
//  GenreViewController.swift
//  iFunpedia
//
//  Created by M Usman Saeed on 31/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var genres:AnyArray = AnyArray()
    var typeDict:Dict = Dict()
    var typeUrl:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genres =  (typeDict["genres"] as? AnyArray)!
        typeUrl = (typeDict["typeUrl"] as? String)!
       
        print(typeUrl)
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
        
        let type = genres[forRowAtIndexPath.row] as! Dict
        cell.textLabel?.text = type["typeName"] as? String
    }
    
    
         // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        let genre:Dict = genres[selectedIndex.row] as! Dict
        
        if segue.identifier == "feed" {
            let vc = segue.destinationViewController as! FeedViewController
            vc.genre = genre
            vc.typeUrl = typeUrl

        }
     }
    
}
