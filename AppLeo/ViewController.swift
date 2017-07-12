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

    @IBOutlet weak var mirrorLabelText: UILabel!
    
    
    @IBAction func myShareButton(_ sender: UIButton) {
        // Hide the keyboard
        mirrorLabelText.resignFirstResponder()
        // Check and see if the text field is empty
        if (mirrorLabelText.text == "") {
            // The text field is empty so display an Alert
            displayAlert(title: "Warning", message: "Enter something in the text field!")
        } else {
            // We have contents so display the share sheet
            displayShareSheet(shareContent: mirrorLabelText.text!)
        }
    }
    
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
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        return
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }

}

