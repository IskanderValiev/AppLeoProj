//
//  ViewController.swift
//  AppLeo
//
//  Created by Iskander Valiev on 7/12/17.
//  Copyright © 2017 ITIS Team #3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textTF: UITextView!
    @IBOutlet weak var mirrorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func translate(_ sender: UIButton) {
        mirrorLabel.text = textTF.text
        mirrorLabel.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    

}

