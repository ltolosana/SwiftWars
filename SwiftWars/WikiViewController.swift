//
//  WikiViewController.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var browser: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var model: SwiftWarsCharacter?
    var canLoad = true
    
    convenience init(model: SwiftWarsCharacter){
        
        self.init(nibName: "WikiViewController", bundle: nil)
        self.model = model
        self.title = "Wikipedia"
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Alta en notificacion
        let nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "notifyThatCharacterDidChange:", name: CHARACTER_DID_CHANGE_NOTIFICATION_NAME, object: nil)
        
        // Sincronizar vista con modelo
        syncViewWithModel()

        // Asigno delegado
        self.browser.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Baja de las notificacion
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

// MARK: - UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        // Paro y oculto el activity
        activityView.hidden = true
        activityView.stopAnimating()
        
        canLoad = false
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        // Paro y oculto el activity
        activityView.hidden = true
        activityView.stopAnimating()
        
        // Creamos el Alert Controller
        var message = ""
        if let alias = model?.alias{
             message = "Error en la carga de la web de " + alias
        }
        
        let alertController = UIAlertController(title: "Error en Wikipedia", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        // Le metemos el boton de OK
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alertController.addAction(okAction)
        
        // Lo mostramos
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return canLoad
    }
    
    
// MARK: - Notifications
    // CHARACTER_DID_CHANGE_NOTIFICATION_NAME
    @objc func notifyThatCharacterDidChange(notification: NSNotification) -> Void{
    
        // Sacamos el personaje
        if let userInfo :Dictionary<String, SwiftWarsCharacter> = notification.userInfo as? Dictionary<String, SwiftWarsCharacter>,
            let character = userInfo[CHARACTER_KEY]{
                
                // Actualizamos el modelo
                model = character
        }
        
        // Sincronizamos modelo -> vista
        syncViewWithModel()
        
    }
    
    
// MARK: - Utils
    
    func syncViewWithModel() -> Void{
        
        canLoad = true
        
        activityView.hidden = false
        activityView.startAnimating()
        if let url = model?.wikiURL{
            browser.loadRequest(NSURLRequest(URL: url))
        }
    }
    

}
