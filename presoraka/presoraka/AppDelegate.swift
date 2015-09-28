//
//  AppDelegate.swift
//  presoraka
//
//  Created by maqj on 15/8/18.
//  Copyright (c) 2015年 msxt. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        testSwift()
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        let tabBar: UITabBarController = UITabBarController()
        
        let indexVC: IndexViewController = IndexViewController()
        let indexNav: UINavigationController = UINavigationController(rootViewController: indexVC)
        
        let treasureVC: TreasureViewController = TreasureViewController()
        let treasureNav: UINavigationController = UINavigationController(rootViewController: treasureVC)
        
        let lifesVC: LifesViewController = LifesViewController()
        let lifesNav: UINavigationController = UINavigationController(rootViewController: lifesVC)
        
        let moreVC: MoreViewController = MoreViewController()
        let moreNav: UINavigationController = UINavigationController(rootViewController: moreVC)
        
        indexNav.tabBarItem.title = "首页"
        treasureNav.tabBarItem.title = "财富"
        lifesNav.tabBarItem.title = "生活"
        moreNav.tabBarItem.title = "更多"
        
        tabBar.viewControllers = [indexNav, treasureNav, lifesNav, moreNav]
        
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func testSwift(){
        _ = UITableView();
        
        if #available(iOS 8.0, *){
            print("iOS versiont >= 8.0")
        }else{
            print("iOS version < 8.0")
        }
        //        let testArr = Array().init();
        
        do{
            _ = try NSString(contentsOfFile: "/file/path/str.txt", encoding: NSUTF8StringEncoding)
            let fileMgr = NSFileManager.defaultManager()

            try fileMgr.createDirectoryAtPath("/test", withIntermediateDirectories: true, attributes: nil)
            
            var isDic: ObjCBool = false
            
            fileMgr.fileExistsAtPath("/tmp/test", isDirectory: &isDic)
            
        }catch {
            print("read content failed.")
        }
        
        
        print(branch())
        
        // Arrays @{
        var emptyArr = [String](count: 4, repeatedValue: "0")
        
        emptyArr.append("test1")
        emptyArr.append("test2")
     
        emptyArr[0] = "2"

        emptyArr.insert("3", atIndex: 1)
        
        print(emptyArr)

        let arrs = ["1", "2", "3"]
        
        print(arrs)
        
        let str1 = "test"
        
        if str1 == "test"{
            print("str1 = \"test\"")
        }
        
        var arrsAdd = emptyArr + arrs
        
        print(arrsAdd)
        
        let element2 = arrsAdd[2]
        
//        element2 = "value"
        arrsAdd[2] = "value"
        
        print(arrsAdd)
        
        print(element2)
        
        arrsAdd[3...5] = ["value1", "value2", "value3"]
        
        print(arrsAdd)
        /// An unsigned integer that can be used as a hash table address.
        print(arrsAdd[0].hash)
        /// The hash value.
        ///
        /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
        ///
        /// - Note: The hash value is not guaranteed to be stable across
        ///   different invocations of the same program.  Do not persist the
        ///   hash value across program runs.
        print(arrsAdd[0].hashValue)
        print("Int64 max = \(Int.max), min = \(Int.min)")
        print("Int8 max = \(Int8.max), min = \(Int8.min)")
        print("Int16 max = \(Int16.max), min = \(Int16.min)")
        print("Int32 max = \(Int32.max), min = \(Int32.min)")
        print("Int64 max = \(Int64.max), min = \(Int64.min)")
        //}@
        
        // Set @{
        var sets: Set<String> = ["set2", "set1", "set3", "set3", "set4"]
        print(sets)
        print(sets.sort())
        
        sets.insert("set5")
        
        print(sets)
        
        sets = []
        
        print(sets)
        //}@
        
        // Dictionary @{
        var dics = [Int:String]()
//        dics
        dics[1] = "I'm 1"
        dics[0] = "I'm 0"
        dics[3] = "I'm 3"
        dics[2] = "I'm 2"
        
        print(dics)
        
        var float: Float = 0.0000000000000001
        
        print("\(float) Is zero \(float.isZero), sizeof = \(sizeof(Int.Type))")
        
        //}@
        
    }
    
    func branch() -> String {
        
        var str = ""
        str += "1"
        defer { str += "2"
            print("branch 1 ", str)
        }
        let counter = 3;
        
        if counter > 0 {
            
            str += "3"
            defer { str += "4" }
            str += "5"
            
            return str
            
        }
        
        str += "6"
        
        
        return str
        
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.msxt.presoraka" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] 
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("presoraka", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("presoraka.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch var error1 as NSError {
            error = error1
            coordinator = nil
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        } catch {
            fatalError()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges {
                do {
                    try moc.save()
                } catch let error1 as NSError {
                    error = error1
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    NSLog("Unresolved error \(error), \(error!.userInfo)")
                    abort()
                }
            }
        }
    }

}

