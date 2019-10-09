//
//  ViewController.swift
//  CollectionView
//
//  Created by Admin on 10/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var addDataTextField: UITextField!
    @IBOutlet weak var popview: UIView!
    private var reuseableIdentifier = "Cell"
    var arrData  = [String]()
    var totalNumberOfItemInRow = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    func initialSetup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let str: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for i in str {
            arrData.append(i.description)
        }
        
        collectionView.allowsMultipleSelection = true
        
        if let flowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let interItemSpace = 10
            let widthOfCell = ((self.collectionView.bounds.width - 30) / 3)
            flowLayout.itemSize = CGSize(width: widthOfCell , height: widthOfCell)
            flowLayout.minimumInteritemSpacing = CGFloat(interItemSpace)
            flowLayout.minimumLineSpacing = CGFloat(interItemSpace)
        }
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    // MARK: UIButton Action
    @IBAction func deleteItem(_ sender: Any) {
        if let selectedCells = collectionView.indexPathsForSelectedItems {
            if selectedCells.count > 0{
                let items = selectedCells.map { $0.item }.sorted().reversed()
                for item in items {
                    arrData.remove(at: item)
                }
                collectionView.deleteItems(at: selectedCells)
                btnDelete.setTitle("DELETE RECORD", for: .normal)
                btnDelete.isHidden = false
            }else{
                let alert = UIAlertController(title: "Delete Records", message: "Please select atleast one record to delete.", preferredStyle: .alert)
                let btnCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(btnCancel)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addElementtapped(_ sender: UIButton){
        self.arrData.append(addDataTextField.text ?? "")
        
        collectionView.reloadData()
        popview.removeFromSuperview()
    }
    
    
    @IBAction func btnAddRow(Sender:Any){
        
        UIView.animate(withDuration: 0.002, animations: {
            self.popview.frame.origin = CGPoint(x: self.collectionView.frame.origin.x, y: 400)
            self.popview.frame.size = CGSize(width: self.collectionView.frame.width, height: 120)
        },completion: nil)
        view.addSubview(popview)
        
        //          arrData.append("ETC")
        //        let indexPath = IndexPath(row: arrData.count - 1, section: 0)
        //        collectionView.insertItems(at: [indexPath])
        //        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
}

//MARK: UICollectionView DataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as? CustomCollectionViewCell
        cell?.displayData(arrData[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = arrData.remove(at: sourceIndexPath.item)
        arrData.insert(temp, at: destinationIndexPath.item)
    }
}

//MARK: UICollectionView Delegate
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        cell.isCellSelected = true
        cell.checkmarkLabel.text = cell.isCellSelected ? "✓" : ""
        cell.checkmarkLabel.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell:CustomCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        cell.isCellSelected = false
        cell.checkmarkLabel.isHidden = true
    }
}

/*
 //MARK: UICollectionView Flow Layout Delegate
 extension ViewController: UICollectionViewDelegateFlowLayout {
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 sizeForItemAt indexPath: IndexPath) -> CGSize {
 let width = ((self.collectionView.bounds.width - 20) / 3)
 return CGSize(width: width, height: width)
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 insetForSectionAt section: Int) -> UIEdgeInsets {
 return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
 return 10
 }
 
 func collectionView(_ collectionView: UICollectionView,
 layout collectionViewLayout: UICollectionViewLayout,
 minimumLineSpacingForSectionAt section: Int) -> CGFloat {
 return 10
 }
 }
 */
