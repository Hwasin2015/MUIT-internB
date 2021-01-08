//
//  search.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/7.
//
/*
import UIKit

class searchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var items = ["一蘭", "一風堂", "丸亀製麺", ]
    

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    var didSelectShopName = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    //segue to detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectShopName = items[indexPath.row]
        self.performSegue(withIdentifier: "shopdetail", sender: self)
//        let  newView  =  UIStoryboard (name:  "main" , bundle:  nil )
//            .instantiateViewController( withIdentifier: "reviewlistview" )
//        self.view.addSubview(newView.view)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as? reviewListController
        nextController?.temp_element = self.didSelectShopName
    }
    
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        self.table.estimatedRowHeight = 50
        self.table.rowHeight = 70
        
    }
}
*/

import UIKit

class searchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items = ["一蘭", "一風堂", "丸亀製麺", ]
    var temp_element = ""
    
    @IBOutlet weak var table: UITableView!
    var didSelectShopName = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    //segue to detail
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectShopName = items[indexPath.row]
        self.performSegue(withIdentifier: "shopdetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as? reviewListController
        nextController?.temp_element = self.didSelectShopName
    }

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //shopname label
        //review table
        self.table.dataSource = self
        self.table.delegate = self
        self.table.estimatedRowHeight = 50
        self.table.rowHeight = 70
        
    }
}


