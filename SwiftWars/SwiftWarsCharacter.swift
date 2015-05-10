//
//  SwiftWarsCharacter.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 9/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import Foundation
import UIKit


@objc class SwiftWarsCharacter {
    
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
        
        // Vader
        let vaderURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")
        
        var vaderSoundURL = NSURL()
        if let vaderPath = NSBundle.mainBundle().pathForResource("vader", ofType: "caf"),
        let soundURL = NSURL(fileURLWithPath: vaderPath){
            vaderSoundURL = soundURL
        }
        
        let vaderPhotoImage = UIImage(named: "darthVader.jpg")
            
        let vader = SwiftWarsCharacter(name: "Anakin Skywalker", alias: "Darth Vader", wikiURL: vaderURL, soundURL: vaderSoundURL, photo: vaderPhotoImage)
        
        
        // Tarkin
        let tarkinURL = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")
        
        var tarkinSoundURL = NSURL()
        if let tarkinPath = NSBundle.mainBundle().pathForResource("tarkin", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: tarkinPath){
                tarkinSoundURL = soundURL
        }
        
        let tarkinPhotoImage = UIImage(named: "tarkin.jpg")
        
        let tarkin = SwiftWarsCharacter(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin", wikiURL: tarkinURL, soundURL: tarkinSoundURL, photo: tarkinPhotoImage)

        
        // Palpatine
        let palpatineURL = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")
        
        var palpatineSoundURL = NSURL()
        if let palpatinePath = NSBundle.mainBundle().pathForResource("palpatine", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: palpatinePath){
                palpatineSoundURL = soundURL
        }
        
        let palpatinePhotoImage = UIImage(named: "palpatine.jpg")
        
        let palpatine = SwiftWarsCharacter(name: "Palpatine", alias: "Darth Sidious", wikiURL: palpatineURL, soundURL: palpatineSoundURL, photo: palpatinePhotoImage)

        
        // Chewbacca
        let chewieURL = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")
        
        var chewieSoundURL = NSURL()
        if let chewiePath = NSBundle.mainBundle().pathForResource("chewbacca", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: chewiePath){
                chewieSoundURL = soundURL
        }

        let chewiePhotoImage = UIImage(named: "chewbacca.jpg")
        
        let chewie = SwiftWarsCharacter(alias: "Chewbacca", wikiURL: chewieURL, soundURL: chewieSoundURL, photo: chewiePhotoImage)

        
        // C-3PO
        let c3poURL = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")
        
        var c3poSoundURL = NSURL()
        if let c3poPath = NSBundle.mainBundle().pathForResource("c3po", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: c3poPath){
                c3poSoundURL = soundURL
        }
        
        let c3poPhotoImage = UIImage(named: "c3po.jpg")
        
        let c3po = SwiftWarsCharacter(alias: "C-3PO", wikiURL: c3poURL, soundURL: c3poSoundURL, photo: c3poPhotoImage)

        
        // Yoda
        let yodaURL = NSURL(string: "http://en.wikipedia.org/wiki/Yoda")
        
        var yodaSoundURL = NSURL()
        if let yodaPath = NSBundle.mainBundle().pathForResource("yoda", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: yodaPath){
                yodaSoundURL = soundURL
        }
        
        let yodaPhotoImage = UIImage(named: "yoda.jpg")
        
        let yoda = SwiftWarsCharacter(name: "Minch Yoda", alias: "Master Yoda", wikiURL: yodaURL, soundURL: yodaSoundURL, photo: yodaPhotoImage)

        
        // R2-D2
        let r2d2URL = NSURL(string: "http://en.wikipedia.org/wiki/R2-D2")
        
        var r2d2SoundURL = NSURL()
        if let r2d2Path = NSBundle.mainBundle().pathForResource("r2-d2", ofType: "caf"),
            let soundURL = NSURL(fileURLWithPath: r2d2Path){
                r2d2SoundURL = soundURL
        }
        
        let r2d2PhotoImage = UIImage(named: "R2-D2.jpg")
        
        let r2d2 = SwiftWarsCharacter(alias: "R2-D2", wikiURL: r2d2URL, soundURL: r2d2SoundURL, photo: r2d2PhotoImage)
        

        rebels = [chewie, c3po, r2d2, yoda]
        imperials = [vader, palpatine, tarkin]
        
    }
    
    func rebelsCount() -> Int{
        return rebels.count
    }
    
    func imperialsCount() -> Int{
        return imperials.count
    }
    
    func rebelAtIndex(index: Int) -> SwiftWarsCharacter{
        return rebels[index]
    }
    
    func imperialAtIndex(index: Int) -> SwiftWarsCharacter{
        return imperials[index]
    }

    
}