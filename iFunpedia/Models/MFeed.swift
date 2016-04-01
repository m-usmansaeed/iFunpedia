//
//  MFeed.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import Foundation

class MFeed {
    
    var price:String = ""
    var itemId:String = ""
    var description:String = ""
    var title:String = ""
    var authorName:String = ""
    var releaseDate:String = ""
    var buyItem:NSURL = NSURL(string: "https://github.com/soarlabs/iFunpedia/blob/master/iFunpedia/Resourace/background.png")!
    var image:NSURL = NSURL(string: "https://github.com/soarlabs/iFunpedia/blob/master/iFunpedia/Resourace/background.png")!
    var imageThumb:NSURL = NSURL(string: "https://github.com/soarlabs/iFunpedia/blob/master/iFunpedia/Resourace/background.png")!
    var media:NSURL = NSURL(string: "https://github.com/soarlabs/iFunpedia/blob/master/iFunpedia/Resourace/background.png")!
    
    
    init?(json: Dict) {
        
        self.title = (json["im:name"]!["label"] as? String)!
        self.image = NSURL(string:(((((json["im:image"]) as! AnyArray)[0] as! Dict)["label"]) as! String).stringByReplacingOccurrencesOfString("55x55", withString: "300x300"))!
        self.imageThumb = NSURL(string:(((((json["im:image"]) as! AnyArray)[0] as! Dict)["label"]) as! String))!
        
        
        self.price = (json["im:price"]!["label"] as? String)!
        self.authorName = (json["im:artist"]!["label"] as? String)!
        
        self.buyItem = NSURL(string:(((((json["link"]) as! AnyArray)[0] as! Dict)["attributes"]!["href"]) as! String))!
        self.media = NSURL(string:(((((json["link"]) as! AnyArray)[1] as! Dict)["attributes"]!["href"]) as! String))!
        
        self.releaseDate = (json["im:releaseDate"]!["attributes"]!!["label"] as? String)!
        self.itemId = ((json["id"]!["attributes"]!!["im:id"]) as? String)!
        
    }
    
    class func parseFeed(feedCollection:AnyArray) -> AnyArray {
        
        var feeds:AnyArray = AnyArray()
        
        for dict in feedCollection {
            let feedObjc = MFeed(json: dict as! Dict)
            feeds.append(feedObjc!)
        }
        return feeds
    }
}

















