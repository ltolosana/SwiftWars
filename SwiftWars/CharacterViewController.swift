//
//  CharacterViewController.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit
import AVFoundation

class CharacterViewController: UIViewController, AVAudioPlayerDelegate {
    
    var model: SwiftWarsCharacter?
    var audioPlayer = AVAudioPlayer()
    
    convenience init(model: SwiftWarsCharacter){
        
        self.init(nibName: "CharacterViewController", bundle: nil)
        self.model = model
        self.title = model.alias
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        self.model = nil
//    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBAction func playSound(sender: AnyObject) {
        
//        var error: NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: model!.soundURL, error: nil)
//        if var player = audioPlayer{
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            println("Sonando")
//        }
        
    
    }
    
    
    @IBAction func displayWiki(sender: AnyObject) {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Sincronizar vista con modelo
        syncViewWithModel()
    }
    
    
// MARK: - Utils
    
    func syncViewWithModel() -> Void{
        self.title = model!.alias
        photoView.image = model!.photo
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
