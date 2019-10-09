//
//  ViewController2.swift
//  AllwhichisLeft
//
//  Created by Appinventiv on 09/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

typealias  TableDelegates = UITableViewDelegate & UITableViewDataSource

class ViewController2: UIViewController {
    var items = ["one","two","three"]
    var itemInCell = ["first","second","three","four"]
    var itemsInSection2 = ["1","2","3"]
    var imageArray1 = [ #imageLiteral(resourceName: "Fast"),#imageLiteral(resourceName: "Slow"),#imageLiteral(resourceName: "HighPitch"),#imageLiteral(resourceName: "Reverb")]
    var imageArray2 = [ #imageLiteral(resourceName: "Icon-76"),#imageLiteral(resourceName: "Stop"),#imageLiteral(resourceName: "Record")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController2:TableDelegates{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return itemInCell.count
        }
        if section == 1{
            return itemsInSection2.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        switch indexPath.section {
        case 0...1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
            if indexPath.section == 0{
                cell.images.image = imageArray1[indexPath.row]
                cell.label.text = itemInCell[indexPath.row]
            }else if indexPath.section == 1{
                cell.images.image = imageArray2[indexPath.row]
                cell.label.text = itemsInSection2[indexPath.row]
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell2", for: indexPath) as! TableCell2
            cell.userText.text = "Hello"
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section]
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: "Information", message: "No info available", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        print("kajsdkshdfafk a fhalfhjdsl")
        return true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let act = UITableViewRowAction(style: .normal, title: "Rows", handler: {
            action,index in print("Edited")
        })
        let delete = UITableViewRowAction(style: .destructive, title: "Delete", handler: {action,index in
            print(("delete"))
        })
    return [act,delete]
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "LeadSwipe", handler: {_,_,_  in
            print("Swipe left")
        })
        let swipe = UISwipeActionsConfiguration(actions: [action])
        return swipe
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "TrailSwipe", handler: {_,_,_ in
            print("RightSwipe")
        })
        let swipe = UISwipeActionsConfiguration(actions: [action])
        return swipe
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        print("sadsd")
    }
//    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//
//    }
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
}
