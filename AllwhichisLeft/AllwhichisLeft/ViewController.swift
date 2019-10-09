//
//  ViewController.swift
//  AllwhichisLeft
//
//  Created by Appinventiv on 29/08/19.
//  Copyright © 2019 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
     @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        print(image.frame)
        
        //self.label.center.x -= self.view.bounds.width
 }
    @IBAction func buttonImage(_ sender: UIButton) {
//        label.text = "Button Pressed"
      
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations:{
        
            self.image.transform = CGAffineTransform(rotationAngle: CGFloat.pi )
        },completion: nil)
        
        UIView.animate(withDuration: 0.0005, delay: 0.45, options: [.curveEaseIn,.repeat], animations:{
            self.image.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
        
            
//            self.image.center.x += self.view.bounds.width - 150
//            self.image.center.y += self.view.bounds.height - 200
//        }, completion: nil)
//        UIView.animate(withDuration: 0.5,animations: {
//            self.image.frame = CGRect(x: 270,y: 600,width: 65,height: 50)
        })
        
      //  print(image.frame)
        
    }
    @IBAction func stopAnimations(_ sender: UIButton){
        self.image.layer.removeAllAnimations()
        
    }
    
}


