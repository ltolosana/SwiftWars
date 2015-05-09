//
//  AppDelegate.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Crear la Window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
 
//        SwiftWarsUniverse.init()

        
        // Probamos a crear un personaje
        // VADER
        let vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        let vaderSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("vader", ofType: "caf")!)
        // OJO REVISAR ESTO QUE LO HE PUESTO EN PMODO SUICIDA
        //        let vaderPhotoData = NSData(contentsOfFile: "darthVader.jpg")
        let vaderPhotoImage = UIImage(named: "darthVader.jpg")
        let vader = SwiftWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", wikiURL: vaderURL, soundURL: vaderSoundURL, photo: vaderPhotoImage)

        
        // Crear los controladores
        var characterVC = CharacterViewController(model: vader)
        var characterNav = UINavigationController(rootViewController: characterVC)
        
        // Asignamos rootVC
        window?.rootViewController = characterNav
        
        // Mostramos 
        window?.makeKeyAndVisible()
        
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
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

