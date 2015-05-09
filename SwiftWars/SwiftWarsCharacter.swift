//
//  SwiftWarsCharacter.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import Foundation
import UIKit


class SwiftWarsCharacter {
    
    var name: String = ""
    var alias: String = ""
    var wikiURL: Optional<NSURL>
    var soundURL: Optional<NSURL>
    var photo: Optional<UIImage>
    
    // Inits
    init () {}
    
    init (name: String, alias: String, wikiURL: NSURL?, soundURL: NSURL?, photo: UIImage?){
        self.name = name
        self.alias = alias
        self.wikiURL = wikiURL
        self.soundURL = soundURL
        self.photo = photo
    }
    
    convenience init (alias: String, wikiURL: NSURL?, soundURL: NSURL?, photo: UIImage?){
        self.init(name: "", alias: alias, wikiURL: wikiURL, soundURL: soundURL, photo: photo)
        
    }
}
    
class SwiftWarsUniverse {
    
    var rebels: Array<SwiftWarsCharacter>
    var imperials : Array<SwiftWarsCharacter>
    
    // Inits
    init () {
        
        // Creo los personajes
        
        // VADER
        let vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        
        let vaderSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("vader", ofType: "caf")!)

        
        // OJO REVISAR ESTO QUE LO HE PUESTO EN PMODO SUICIDA
//        let vaderPhotoData = NSData(contentsOfFile: "darthVader.jpg")
        let vaderPhotoImage = UIImage(named: "darthVader.jpg")
        
            
        let vader = SwiftWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", wikiURL: vaderURL, soundURL: vaderSoundURL, photo: vaderPhotoImage)
        
        
        // CHEWBACCA
        let chewieURL = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")
        
        let chewieSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("chewbacca", ofType: "caf")!)

        
        // OJO REVISAR ESTO QUE LO HE PUESTO EN PMODO SUICIDA
//        let chewiePhotoData = NSData(contentsOfFile: "chewbacca.jpg")
        let chewiePhotoImage = UIImage(named: "chewbacca.jpg")
        
        
        let chewie = SwiftWarsCharacter(alias: "Chewbacca", wikiURL: chewieURL, soundURL: chewieSoundURL, photo: chewiePhotoImage)

        
        rebels = [chewie]
        imperials = [vader]
        
    }
    
    func rebelsCount() -> Int{
        return rebels.count
    }
    
    func imperialsCount() -> Int{
        return imperials.count
    }
    
}