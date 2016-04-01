//
//  DetailsViewController.swift
//  iFunpedia
//
//  Created by M Usman Saeed on 01/04/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation

class DetailsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,FeedCellDelegate {
    
    
    var feedItem:MFeed? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: "ReachabilityStatusChanged", object: nil)
        
        self.reachabilityChanged(nil)
        
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedCell
        cell.delegate = self
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    
    func configureCell(cell: FeedCell, forRowAtIndexPath: NSIndexPath) {
        
        
        
        KingfisherManager.sharedManager.retrieveImageWithURL(feedItem!.image, optionsInfo: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, imageURL) -> () in
            cell.imgView.image = image
            //            print(image)
        })
        
        
        cell.feedObj = feedItem
        cell.lblTitle.textColor = UIColor.whiteColor()
        cell.lblTitle.text = feedItem!.title
        cell.lblArtist.text = feedItem!.authorName
        cell.lblPrice.text = feedItem!.price
        cell.lblReleaseDate.text = feedItem!.releaseDate
        
    }
    
    func didClickByeNow(feedObj: MFeed){
        
    }
    
    @IBAction func btnBack(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func btnPlayVideo(sender: AnyObject) {
        
        if let url = self.feedItem?.media {
            let player = AVPlayer(URL: url)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.presentViewController(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
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
