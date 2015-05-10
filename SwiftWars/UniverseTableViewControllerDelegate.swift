//
//  UniverseTableViewControllerDelegate.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 10/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import Foundation


@objc protocol UniverseTableViewControllerDelegate{
    optional func universeTableViewController(swvc: UniverseTableViewController, didSelectCharacter: SwiftWarsCharacter) -> Void
}


