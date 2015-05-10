//
//  CharacterViewController.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController, AVAudioPlayerDelegate, UISplitViewControllerDelegate, UniverseTableViewControllerDelegate {
    
    var model: SwiftWarsCharacter?
    var audioPlayer = AVAudioPlayer()
    
    convenience init(model: SwiftWarsCharacter){
        
        self.init(nibName: "CharacterViewController", bundle: nil)
        self.model = model
        self.title = model.alias
    }
    
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBAction func playSound(sender: AnyObject) {
        
        if let myModel = model{
            
            audioPlayer = AVAudioPlayer(contentsOfURL: myModel.soundURL, error: nil)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
    
    
    @IBAction func displayWiki(sender: AnyObject) {
        
        // Creamos un wikiVC
        var wikiVC = WikiViewController()
        if let theModel = model{
            wikiVC = WikiViewController(model: theModel)
        }
        
        // Hacemos push
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Para no ocupar toda la pantalla cuando estamos en un NavigationVC
        edgesForExtendedLayout = UIRectEdge.None
        
        // Sincronizar vista con modelo
        syncViewWithModel()
        
        // Nos ponemos el boton del SplitVC
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        
    }
  
// MARK: - UISplitViewControllerDelegate

    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        // Averiguamos si la tabla se ve o no
        if displayMode == UISplitViewControllerDisplayMode.PrimaryHidden{
            // La tabla esta oculta asi que ponemos el boton
            navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
        }else{
            // La tabla se ve, asi que ocultamos el boton
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    
// MARK: - UniverseTableViewControllerDelegate
    func universeTableViewController(swvc: UniverseTableViewController, didSelectCharacter: SwiftWarsCharacter) -> Void{
        
        // Actualizamos el modelo
        model = didSelectCharacter
        
        // Sincronizamos vistas con modelo
        syncViewWithModel()
        
    }

    
// MARK: - Utils
    
    func syncViewWithModel() -> Void{
        if let myModel = self.model{
            self.title = myModel.alias
            photoView.image = myModel.photo
        }
    }
    

}
