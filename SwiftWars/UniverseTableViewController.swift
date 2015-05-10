//
//  UniverseTableViewController.swift
//  SwiftWars
//
//  Created by Luis M Tolosana Simon on 10/5/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

import UIKit

class UniverseTableViewController: UITableViewController, UniverseTableViewControllerDelegate {

    let IMPERIAL_SECTION = 0
    let REBEL_SECTION = 1
 
    var model: SwiftWarsUniverse?
    var delegate: UniverseTableViewControllerDelegate?
    
    
    convenience init(model: SwiftWarsUniverse, style: UITableViewStyle){
        
        self.init(style: style)
//        self.init(nibName: "UniverseTableViewController", bundle: nil)
        self.model = model
        self.title = "StarWars Universe"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

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

    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
