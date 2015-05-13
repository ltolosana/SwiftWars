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
        
        // Comprobamos a ver si existe el ultimo personaje seleccionado
        let userDefs = NSUserDefaults.standardUserDefaults()
        let pj: AnyObject? = userDefs.objectForKey(LAST_SELECTED_CHARACTER)
        if pj == nil{
            
            // y si no existe metemos uno por defecto
            userDefs.setObject([IMPERIAL_SECTION, 0], forKey: LAST_SELECTED_CHARACTER)
            
            // y sincronizamos
            userDefs.synchronize()
        }
        
        
        
        // Crear la Window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
 
        // Creamos un modelo
        let swUniverse = SwiftWarsUniverse.init()

        // Detectamos el tipo de pantalla
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad{
            
            // Tipo iPad
            configureForPadWithModel(swUniverse)
        }else{
            
            // Tipo iPhone
            configureForPhoneWithModel(swUniverse)
        }
        
        
        // Mostramos 
        window?.makeKeyAndVisible()
        
        return true
    }

    
    
    func configureForPadWithModel(model: SwiftWarsUniverse){
        
        // Crear los controladores
        var universeVC = UniverseTableViewController(model: model, style: UITableViewStyle.Plain)
        var universeNav = UINavigationController(rootViewController: universeVC)
        
        var characterVC = CharacterViewController(model: lastSelectedCharacterInUniverse(model))
        var characterNav = UINavigationController(rootViewController: characterVC)
        
        
        // Crear el combinador
        var splitVC = UISplitViewController()
        splitVC.viewControllers = [universeNav, characterNav]
        
        
        // Asignar delegados
        splitVC.delegate = characterVC
        universeVC.delegate = characterVC
        
        
        // Asignamos rootVC
        window?.rootViewController = splitVC

    }

    func configureForPhoneWithModel(model: SwiftWarsUniverse){
        
        // Crear los controladores
        var universeVC = UniverseTableViewController(model: model, style: UITableViewStyle.Plain)
        var universeNav = UINavigationController(rootViewController: universeVC)
                
        
        // Asignar delegados
        universeVC.delegate = universeVC
        
        
        // Asignamos rootVC
        window?.rootViewController = universeNav

        
    }
    
    func lastSelectedCharacterInUniverse (universe: SwiftWarsUniverse) -> SwiftWarsCharacter{
    
        // Obtengo el NSUSERDEFAULTS
        let userDefs = NSUserDefaults.standardUserDefaults()
        
        // Saco las coordenadas del ultimo personaje
        let coords: AnyObject? = userDefs.objectForKey(LAST_SELECTED_CHARACTER)
        let (section: AnyObject?, position: AnyObject?) = (coords?.objectAtIndex(0), coords?.objectAtIndex(1))
            
            
        
 
        // Obtengo el personaje
        var swCharacter :SwiftWarsCharacter = SwiftWarsCharacter()
        if let sec: Int = section as? Int, let pos: Int = position as? Int{
            if sec == IMPERIAL_SECTION{
                swCharacter = universe.imperialAtIndex(pos)
            }else{
                swCharacter = universe.rebelAtIndex(pos)
            }
        }
        
        // Lo devuelvo
        return swCharacter;
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

