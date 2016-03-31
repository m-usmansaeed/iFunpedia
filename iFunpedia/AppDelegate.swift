//
//  AppDelegate.swift
//  Funpedia
//
//  Created by M Usman Saeed on 29/03/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

var reachability : Reachability?
var reachabilityStatus = "The Internet connection appears to be offline."
var storageData :Dict = Dict()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isInternetAvailable:Reachability?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        
        do {
            isInternetAvailable = try Reachability.reachabilityForInternetConnection()
        } catch {
//            print("Unable to create Reachability")
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.reachabilityChanged(_:)),name: ReachabilityChangedNotification,object: isInternetAvailable)
        do{
            try isInternetAvailable?.startNotifier()
        }catch{
//            print("could not start reachability notifier")
        }


        
        storageData = CommonFunctions.loadPlistFromProject("Storage")!
        
        
//        print(storageData)
        
            
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        reachability!.stopNotifier()
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: ReachabilityChangedNotification,
                                                            object: reachability)
    }
    
    func reachabilityChanged(note: NSNotification) {
        reachability = note.object as? Reachability
        statusChangedWithReachability(reachability!)
    }
    
    func statusChangedWithReachability(currentReachabilityState:Reachability) {
     
        currentReachabilityState.currentReachabilityStatus
        print(currentReachabilityState.currentReachabilityString)
        
        if currentReachabilityState.currentReachabilityString != reachabilityStatus {
            reachabilityStatus = currentReachabilityState.currentReachabilityString
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("ReachabilityStatusChanged", object: nil)
    }
    
}

