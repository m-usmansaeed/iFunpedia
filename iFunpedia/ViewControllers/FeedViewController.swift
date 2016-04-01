//
//  FeedViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController,APIManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var feed:AnyArray = AnyArray()
    var genre:Dict = Dict()
    var typeUrl:String = ""

    let apiManager:APIManager = APIManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: "ReachabilityStatusChanged", object: nil)
        
        self.reachabilityChanged(nil)
        
                let countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
                print(countryCode)
        
        genre["typeUrl"] = typeUrl
        genre["countryCode"] = countryCode
        
        print(genre)
        print(typeUrl)

        
                apiManager.delegate = self
                apiManager.getAllBooks(genre)
        
    }
    
    func reachabilityChanged(note: NSNotification?) {
        
        switch reachabilityStatus {
        case "Cellular":
            print(reachabilityStatus)
//            CommonFunctions.showStatus(UIColor.greenColor())
            
        case "WiFi":
            print(reachabilityStatus)
//            CommonFunctions.showStatus(UIColor.greenColor())
            
        case "No Connection":
            print(reachabilityStatus)
            CommonFunctions.showStatus(UIColor.redColor())
        default:
            print(reachabilityStatus)
            
        }
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
        return feed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        
    }
    
    
    func didGetAllAudioBooksSuccess(manager: APIManager) {
        print(manager.data!)
    }
    
    func didFailedToGetAllBooks(manager: APIManager) {
        print(manager.err!.localizedDescription)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
