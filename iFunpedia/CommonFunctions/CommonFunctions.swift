//
//  CommonFunctions.swift
//  Funpedia
//
//  Created by M Usman Saeed on 30/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import Foundation
import UIKit

/// showStatus is for showing internet status view

class CommonFunctions {
    
    class func showStatus(color:UIColor) {
        
        let window:UIWindow  = UIApplication.sharedApplication().keyWindow!
        let polygonView:UIView = UIView(frame: CGRectMake(0,-85,window.bounds.width,85))
        polygonView.backgroundColor = color
        polygonView.layer.zPosition = 0
        
        window.addSubview(polygonView)
        UIView.animateWithDuration(0.5, animations: {
            polygonView.frame = CGRectMake(0, polygonView.frame.origin.y+85, polygonView.frame.size.width, polygonView.frame.size.height)
        }) { (finished) in
            UIView.animateWithDuration(0.5, delay: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                polygonView.frame = CGRectMake(0,-85, polygonView.frame.size.width, polygonView.frame.size.height)
                }, completion: { (finished) in
            })
        }
    }
    
    class func loadPlistFromProject(filename: String) -> Dictionary<String, AnyObject>? {
        
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "plist") {
            return NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject>
        }
        print("Could not find file: \(filename)")
        return nil
    }
    
    
}
