//
//  AddButtonVC.swift
//  CollectionView
//
//  Created by Appinventiv on 11/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class AddButtonVC: UIViewController {

    @IBOutlet weak var addTextField: UITextField!
    var dataToAdd = String()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
      dataToAdd = addTextField.text ?? ""
      dismiss(animated: true, completion: nil)
    }
    
}
