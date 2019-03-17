//
//  FoodViewController.swift
//  Eternity
//
//  Created by A. Rodgers on 3/16/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var foodLst:[String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        print(foodLst)
    }
    
    @IBAction func add(_ sender: Any) {
        self.performSegue(withIdentifier: "camera", sender: self)
    }
    
    //self.performSegue(withIdentifier: "camera", sender: self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodLst.count // number of personal posts
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.selectionStyle = .none
        
        //let cell = UITableViewCell()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as UITableViewCell
        cell.foodImage.image = UIImage(named: foodLst[indexPath.row] + ".jpg")
        cell.foodName.text = String(foodLst[indexPath.row]).uppercased()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass the selected object to the new view controller.
        let viewController = segue.destination as! ScannerViewController
        viewController.lst = self.foodLst
        
    }

}
