//
//  TableCell.swift
//  AllwhichisLeft
//
//  Created by Appinventiv on 09/09/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit
import  Foundation

class TableCell: UITableViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
class TableCell2: UITableViewCell{
    @IBOutlet weak var userText : UITextView!
    
}
