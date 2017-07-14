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
    var shareImage: UIImage!
    @IBOutlet weak var mirrorLabelText: UILabel!
    
    @IBOutlet weak var myShareButtonProperty: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textTV.layer.borderWidth = 1.0
        textTV.layer.borderColor = UIColor.black.cgColor
        
        myShareButtonProperty.sizeToFit()
    }
    
    
    
    @IBAction func translate(_ sender: UIButton) {
        mirrorLabelText.text = textTV.text
        textTV.resignFirstResponder()
        
        UIView.animate(withDuration: 1.0) {
            self.mirrorLabelText.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        mirrorLabelText.sizeToFit()
        
    }
    
    @IBAction func myShareButton(_ sender: UIButton) {
        // Hide the keyboard
        mirrorLabelText.resignFirstResponder()
        // Check and see if the text field is empty
        //        if (mirrorLabelText.text == "") {
        //            // The text field is empty so display an Alert
        //            displayAlert(title: "Warning", message: "Enter something in the text field!")
        //        } else {
        //            // We have contents so display the share sheet
        //            displayShareSheet(shareContent: mirrorLabelText.text!)
        //        }
        
        
        
        let firstActivityItem = "Created with AppLeo"
        let secondActivityItem : NSURL = NSURL(string: "http//:urlyouwant")!
        // If you want to put an image
        
        screenShotMethod()
        //shareImage.withHorizontallyFlippedOrientation()
        //var image = UIImage(CGImage: shareImage.CGImage, scale: 1.0, orientation: .RightMirrored)
        let imagel : UIImage! = flipImageLeftRight(shareImage)
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem, imagel], applicationActivities: nil)
        
        // This lines is for the popover you need to show in iPad
        activityViewController.popoverPresentationController?.sourceView = (sender )
        
        //                // This line remove the arrow of the popover to show in iPad
        //                activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.allZeros
        //                activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        //
        //         Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivityType.postToWeibo,
            UIActivityType.print,
            UIActivityType.assignToContact,
            UIActivityType.saveToCameraRoll,
            UIActivityType.addToReadingList,
            UIActivityType.postToFlickr,
            UIActivityType.postToVimeo,
            UIActivityType.postToTencentWeibo
        ]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    func screenShotMethod() {
        //Create the UIImage
        UIGraphicsBeginImageContext(mirrorLabelText.frame.size)
        
        mirrorLabelText.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        shareImage = image
        //Save it to the camera roll
        //UIImageWriteToSavedPhotosAlbum(image , nil, nil, nil)
        
    }
    func flipImageLeftRight(_ image: UIImage) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: image.size.width, y: image.size.height)
        context.scaleBy(x: -image.scale, y: -image.scale)
        
        context.draw(image.cgImage!, in: CGRect(origin:CGPoint.zero, size: image.size))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
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

