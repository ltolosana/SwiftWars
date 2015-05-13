//
//  UniverseTableViewController.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 10/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit

let CHARACTER_DID_CHANGE_NOTIFICATION_NAME = "characterDidChangeNotification"
let CHARACTER_KEY = "characterKey"

let LAST_SELECTED_CHARACTER = "lastCharacter"

let IMPERIAL_SECTION = 0
let REBEL_SECTION = 1

class UniverseTableViewController: UITableViewController, UniverseTableViewControllerDelegate {

    var model: SwiftWarsUniverse?
    var delegate: UniverseTableViewControllerDelegate?
    
    
    convenience init(model: SwiftWarsUniverse, style: UITableViewStyle){
        
        self.init(style: style)
        self.model = model
        self.title = "StarWars Universe"
    }

    
// MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        
        var rows = 0
        if let myModel = model{
            if section == IMPERIAL_SECTION{
                rows = myModel.imperialsCount()
            }else{
                rows = myModel.rebelsCount()
            }
        }
        return rows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Configure the cell...
        var cell = UITableViewCell()
        
        if let myModel = model{
        
            // Averiguamos personaje
            var character : SwiftWarsCharacter
            
            if indexPath.section == IMPERIAL_SECTION{
                character = myModel.imperialAtIndex(indexPath.row)
            }else{
                character = myModel.rebelAtIndex(indexPath.row)
            }
            
            // Creamos la celda
            
            let cellId = "SwiftWarsCell"
            
            if let myCell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell{
                cell = myCell
            }else{
                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
            }
            
            // La configuramos (sincronizamos modelo --> celda)
            cell.imageView?.image = character.photo
            cell.textLabel?.text = character.alias
            cell.detailTextLabel?.text = character.name
            
            
        }
        return cell

    }

    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == IMPERIAL_SECTION{
            return "Imperials"
        }else{
            return "Rebels"
        }
    }

    
// MARK: - Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let myModel = model{
            
            // Averiguamos personaje
            var character : SwiftWarsCharacter
            
            if indexPath.section == IMPERIAL_SECTION{
                character = myModel.imperialAtIndex(indexPath.row)
            }else{
                character = myModel.rebelAtIndex(indexPath.row)
            }
         
            //Comprobamos si tenemos un delegado que "entienda" ;-)
            // Y si eso que trabaje
            delegate?.universeTableViewController?(self, didSelectCharacter: character)
     
            // Y tambien mando notificacion
            let nc = NSNotificationCenter.defaultCenter()
            
            let dict: Dictionary = [CHARACTER_KEY: character]
            
            let n = NSNotification(name: CHARACTER_DID_CHANGE_NOTIFICATION_NAME, object: self, userInfo: dict as [NSObject : AnyObject])
            
            nc.postNotification(n)
            
            // Y guardo el personaje seleccionado
            let coords = [indexPath.section, indexPath.row]
            let userDefs = NSUserDefaults.standardUserDefaults()
            
            userDefs.setObject(coords, forKey: LAST_SELECTED_CHARACTER)
            
            userDefs.synchronize()
            
        }
        
    }
    
    
// MARK: - UniverseTableViewControllerDelegate
    func universeTableViewController(swvc: UniverseTableViewController, didSelectCharacter: SwiftWarsCharacter) -> Void
    {
        
        // Creamos el VC
        var characterVC = CharacterViewController(model: didSelectCharacter)
        
        //Hacemos push
        navigationController?.pushViewController(characterVC, animated: true)
        
    }
    
    
}
