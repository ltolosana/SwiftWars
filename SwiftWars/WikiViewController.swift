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
                
        
        // Sincronizar vista con modelo
        syncViewWithModel()

        // Asigno delegado
        self.browser.delegate = self
    }
    

    // MARK: - UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        // Paro y oculto el activity
        activityView.hidden = true
        activityView.stopAnimating()
        
        canLoad = false
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        return canLoad
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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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