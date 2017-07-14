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
    var foodRecipes: [String] = []
    var foodDescription: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNames.append("Aidaho Potato")
        foodImagesName.append("aidahoPotato")
        foodDescription.append("Картофель «Айдахо» — один из самых часто приготовляемых картофельных гарниров в мире. Несмотря на свое американское происхождение и оригинальное название (просто картофель там основная сельскохозяйственная культура), в России его больше знают как картофель по-деревенски. Чаще всего он подается к жареному мясу. Мясо может быть в любой форме: стейк, бургер, тонкая соломка. Впрочем, «Айдахо» вполне убедителен и без протеиновых скреп. Сам по себе. Как свой собственный штат Айдахо.")
        foodRecipes.append(" 1. Картофель хорошо промыть (очищать не надо), нарезать вдоль на восемь долек, положить в кастрюлю с холодной подсоленной водой.\n 2. Довести до кипения и варить 2–3 минуты. Слить воду и поставить картофель остывать.\n 3. Смешать оливковое масло с мелко порезанной зеленью, соусом и продавленным через чеснокодавилку чесноком. Выложить картофель на противень в один слой, предварительно обмакнув дольки в получившуюся смесь.\n 4. Запекать в духовке 15–20 минут при температуре 200 градусов.")
        
        foodNames.append("Ratatui")
        foodImagesName.append("ratatui1")
        
        foodNames.append("Nut")
        foodImagesName.append("nut")
        
        foodNames.append("Guacamole");
        foodImagesName.append("guacamole")
        
        foodNames.append("Babaganush")
        foodImagesName.append("babaganush")
        
        foodNames.append("Falafel")
        foodImagesName.append("falafel")
        
        navigationItem.title = "Food catalog"
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "description", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "description" && sender != nil {
            
            let index = sender as! Int
            let destinationVC = segue.destination as! FoodDescription
            
            destinationVC.foodImageName = foodImagesName[index]
            destinationVC.foodName = foodNames[index]
            destinationVC.foodDescription = foodDescription[index]
            destinationVC.foodRecipe = foodRecipes[index]
            
        }
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

