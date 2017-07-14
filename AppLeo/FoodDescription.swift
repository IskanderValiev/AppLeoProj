//
//  FoodDescription.swift
//  AppLeo
//
//  Created by Iskander Valiev on 7/14/17.
//  Copyright © 2017 ITIS Team #3. All rights reserved.
//

import UIKit

class FoodDescription: UIViewController {
    @IBOutlet weak var foodView: UIImageView!
    @IBOutlet weak var reciepView: UITextView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionView: UITextView!
    
    var foodImageName: String = ""
    var foodName: String = ""
    var foodDescription: String = ""
    var foodRecipe: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
            
    }
    
    func setup() {
        reciepView.isEditable = false
        descriptionView.isEditable = false
        
        foodView.image = UIImage(named: foodImageName)

        
        foodNameLabel.text = foodName
        foodNameLabel.sizeToFit()
        
        descriptionView.text = foodDescription
        descriptionView.sizeToFit()
        
        reciepView.text = foodRecipe
        reciepView.sizeToFit()
        
        let height = foodView.frame.size.height + foodNameLabel.frame.size.height + descriptionView.frame.size.height + reciepView.frame.size.height
        
        scrollView.contentSize = CGSize(width: view.bounds.width, height: height + 100)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
