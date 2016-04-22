//
//  AppDelegate.swift
//  prueba3dtouch
//
//  Created by Guillermo Apoj on 1/4/16.
//  Copyright © 2016 Guillermo Apoj. All rights reserved.
//

import UIKit

enum TestShortcutType: String{
    case AbrirStatic
    case AbrirDynamicIcon
    case AbrirDynamicContact
    case AbrirDynamicPhoto
    init?(shortcutItem: UIApplicationShortcutItem) {
        guard let last = shortcutItem.type.componentsSeparatedByString(".").last else { return nil }
        self.init(rawValue: last)
    }
    
    var type: String {
        return NSBundle.mainBundle().bundleIdentifier! + ".\(self.rawValue)"
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //llamado solo si se abre la aplicacion de 0(launch) no si se la saca de background (resume)
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        print("didFinishLaunchingWithOptions fue llamado")
        var isLaunchedFromQuickAction = false
        //se chequea si el launch es desde una Quick Action, lo hago asi para poner fondo blanco si no se inicio la app desde un shortcut y solo en ese caso
        if let shorcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem{
            isLaunchedFromQuickAction = true
            handleQuickAction(shorcutItem)
            
        }else{
            self.window?.rootViewController?.view.backgroundColor = UIColor.whiteColor()
        }
        // devuelve false si fue launch desde un shortcut, asi performAction  no se llama doblemente
        return !isLaunchedFromQuickAction
        
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
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    //MARK:- 3D touch
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem))
    }
    
    func handleQuickAction(shortcutItem: UIApplicationShortcutItem) -> Bool{
        var  quickActionHandled = false
        
        if let rootViewController = window?.rootViewController, let shortcutType = TestShortcutType.init(shortcutItem: shortcutItem){
            let alertController = UIAlertController(title: "", message: "", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            switch shortcutType {
            case .AbrirStatic:
                //Get root navigation viewcontroller and its first controller
                let rootNavigationViewController = window!.rootViewController as? UINavigationController
                let mainViewController = rootNavigationViewController?.viewControllers.first as UIViewController?
                //Pop to root view controller so that approperiete segue can be performed
                rootNavigationViewController?.popToRootViewControllerAnimated(false)
                quickActionHandled = true
                mainViewController!.performSegueWithIdentifier("peakPop", sender: rootViewController)
                break
            case .AbrirDynamicIcon:
                alertController.message = "Dynamic Icon"
                rootViewController.presentViewController(alertController, animated: true, completion: nil)
                break
                
            case .AbrirDynamicContact:
                alertController.message = "Dynamic Contact"
                rootViewController.presentViewController(alertController, animated: true, completion: nil)
                break
                
            case .AbrirDynamicPhoto:
                alertController.message = "Dynamic Photo"
                rootViewController.presentViewController(alertController, animated: true, completion: nil)
                break
            }
            
            
        }
        
        return quickActionHandled
    }
    
}

