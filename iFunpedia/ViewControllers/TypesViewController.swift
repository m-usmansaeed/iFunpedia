//
//  TypesViewController.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

class TypesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var types:AnyArray = AnyArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        types =  storageData[MTk_AudioBooks]![Tk_AudioBooks] as! AnyArray

        
        
        
        
        //        Audio Books
        //        top audio books
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/json
        //        Art & entertainment
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000041/json
        //        audio books latino
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000070/json
        //        biography & memori
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000042/json
        //        business
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000043/json
        //        classics
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000045/json
        //        comedy
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000046/json
        //        drama & poetry
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000047/json
        //        fiction
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000040/json
        //        history
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000049/json
        //        kids & young adults
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000044/json
        //        languages
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000050/json
        //        mystery
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000051/json
        //        news
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=74/json
        //        nonfiction
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000052/json
        //        programs & performances
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=75/json
        //        religion & spirtuality
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000053/json
        //        romance
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000069/json
        //        Sci Fi & fantasy
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000055/json
        //        science
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000054/json
        //        self development
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000056/json
        //        speakers & storytellers
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000048/json
        //        sports
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000057/json
        //        technology
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000058/json
        //        travel & adventure
        //        https://itunes.apple.com/us/rss/topaudiobooks/limit=10/genre=50000059/json
        

        
        
        
        
        
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
