//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Admin on 10/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lbl:UILabel!
    @IBOutlet weak var checkmarkLabel: UILabel!
    var isCellSelected: Bool = false
    
    func displayData(_ titleText:String){
        self.lbl.text = titleText
        self.checkmarkLabel.text = isSelected ? "✓" : ""
        self.backgroundColor = self.randomColor()
    }
    
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
