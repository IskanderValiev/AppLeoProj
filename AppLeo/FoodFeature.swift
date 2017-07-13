//
//  FoodFeature.swift
//  AppLeo
//
//  Created by Iskander Valiev on 7/13/17.
//  Copyright © 2017 ITIS Team #3. All rights reserved.
//

import UIKit





class FoodFeature: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodTV: UITableView!
    
    var foodNames: [String] = []
    var foodImagesName: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNames.append("Aidaho Potato")
        foodImagesName.append("aidahoPotato")
        
        foodNames.append("Ratatui")
        foodImagesName.append("ratatui1")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
        
        cell.imageView?.image = UIImage(named: foodImagesName[indexPath.row])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.textLabel?.text = foodNames[indexPath.row]
        
        return cell
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

