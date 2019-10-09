//
//  DataPage.swift
//  DelegationCheck
//
//  Created by Appinventiv on 23/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import Foundation

import UIKit
//protocol delegation{
//    var data: String{get set}
//}

class DataPage: UIViewController {
   
    @IBOutlet weak var dataTextField: UITextField!
//    var abc : ((String)-> ())?
//    var delegate: delegation?
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendDataButton(_ sender: UIButton) {
//        delegate?.data = dataTextField.text!
//            abc?(dataTextField.text!)
        let textfieldtext =  ["text" : (dataTextField.text ?? "")]
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "feed") , object: nil, userInfo: textfieldtext as [AnyHashable : Any])
        self.navigationController?.popViewController(animated: true)
    }

  
}
