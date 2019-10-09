//
//  ViewController.swift
//  DelegationCheck
//
//  Created by Appinventiv on 23/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController//,delegation
{
    
    @IBOutlet weak var sendToNextPageButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        }
    
   override func viewWillAppear(_ animated: Bool) {
        dataLabel.text = data
    NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(_:)), name:NSNotification.Name(rawValue: "feed") , object: nil)
    }
    
    @IBAction func sendToNextPageButton(_ sender: UIButton) {
    
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataPage") as! DataPage
//        vc.abc = { result in
//            self.data = result
//        }
//        vc.delegate = self

        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func notificationReceived(_ notification:NSNotification){
        let text = notification.userInfo?["text"] as? String
        data = text!
    }
}
