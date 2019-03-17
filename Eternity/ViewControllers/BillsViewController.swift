//
//  BillsViewController.swift
//  Eternity
//
//  Created by A. Rodgers on 3/16/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class BillsViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let data = ["$98.45", "$119.90", "$110.78", "$130.87", "$135.34", "$156.76"]
    
    let pics = ["bill1", "bill2", "bill3", "bill4", "bill5", "bill6"]
    
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        filteredData = data

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillsCell", for: indexPath) as! BillsCell
        
        cell.billsActionText.text = data[indexPath.row]
        cell.billsImageView.image = UIImage(named: pics[indexPath.row])
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
}
