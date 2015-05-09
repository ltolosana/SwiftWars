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
    var wikiURL: NSURL?
    var soundData: NSData?
    var photo: UIImage?
    
    // Inits
    init () {}
    
    init (name: String, alias: String, wikiURL: NSURL?, soundData: NSData?, photo: UIImage?){
        self.name = name
        self.alias = alias
        self.wikiURL = wikiURL
        self.soundData = soundData
        self.photo = photo
    }
    
}