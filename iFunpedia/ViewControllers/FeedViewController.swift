//
//  FeedViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit
import Kingfisher
import StoreKit

class FeedViewController: UIViewController,APIManagerDelegate,FeedCellDelegate,SKStoreProductViewControllerDelegate {
    
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
        
        apiManager.delegate = self
        apiManager.getAllBooks(genre)
        
    }
    
    func reachabilityChanged(note: NSNotification?) {
        
        switch reachabilityStatus {
        case "Cellular":
            print(reachabilityStatus)
        case "WiFi":
            print(reachabilityStatus)
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
        return feed.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedCell
        cell.delegate = self
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    
    func configureCell(cell: FeedCell, forRowAtIndexPath: NSIndexPath) {
        
        let item:MFeed = self.feed[forRowAtIndexPath.row] as! MFeed
        
        KingfisherManager.sharedManager.retrieveImageWithURL(item.imageThumb, optionsInfo: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, imageURL) -> () in
            cell.imgView.image = image
        })
        
        
        cell.feedObj = item
        cell.lblTitle.textColor = UIColor.whiteColor()
        cell.lblTitle.text = item.title
        cell.lblArtist.text = item.authorName
        cell.lblPrice.text = item.price
        cell.lblReleaseDate.text = item.releaseDate
        
    }
    
    
    func didGetAllAudioBooksSuccess(manager: APIManager) {
        
        if let data = manager.data!["feed"]{
            
            feed =  MFeed.parseFeed(data["entry"] as! AnyArray)
            self.tableView.reloadData()
            
        }
    }
    
    func didFailedToGetAllBooks(manager: APIManager) {
        print(manager.err!.localizedDescription)
    }
    
    func didClickByeNow(feedObj: MFeed){
        jumpToAppStore(feedObj.itemId)
    }
    
    func jumpToAppStore(appId: String) {
        
        let url = "http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=\(appId)"
        UIApplication.sharedApplication().openURL(NSURL(string: url)!)
    }
    
    @IBAction func btnBack(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)!
        let item:MFeed = feed[selectedIndex.row] as! MFeed
        
        if segue.identifier == "details" {
            let vc = segue.destinationViewController as! DetailsViewController
            vc.feedItem = item
            
        }
    }
    
    
}
