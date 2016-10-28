//
//  AppDelegate.swift
//  ToDoList
//
//  Created by 1800 on 10/11/16.
//  Copyright © 2016 1800. All rights reserved.
//

import UIKit
import PubNub

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PNObjectEventListener {

    var window: UIWindow?
    lazy var client: PubNub = {
        let config = PNConfiguration(publishKey: "pub-c-e97ea572-f4aa-46e6-8c2c-4b223cc7d107",
                                   subscribeKey: "sub-c-509ff81c-8fc4-11e6-bb6b-0619f8945a4f")
        let pub = PubNub.clientWithConfiguration(config)
        return pub
    }()
    
    override init(){
        super.init()
        client.addListener(self)
    }
    
    func client(_ client: PubNub, didReceive status: PNStatus) {
        if status.isError{
            showAlert(error: status.isError.description)
        }
    }
    
    func showAlert(error:String)  {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let OKAction = UIAlertAction(title:"OK", style:.default, handler:nil)
        alertController.addAction(OKAction)
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil )
        
        
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

