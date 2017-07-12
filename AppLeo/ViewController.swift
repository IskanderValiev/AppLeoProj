//
//  ViewController.swift
//  AppLeo
//
//  Created by Iskander Valiev on 7/12/17.
//  Copyright © 2017 ITIS Team #3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textTV: UITextView!
    @IBOutlet weak var mirrorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textTV.layer.borderWidth = 1.0
        textTV.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func translate(_ sender: UIButton) {
        mirrorLabel.text = textTV.text
        
        UIView.animate(withDuration: 1.0) { 
          self.mirrorLabel.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        mirrorLabel.sizeToFit()
        
    }
    

}

