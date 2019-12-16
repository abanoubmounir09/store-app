//
//  ViewController.swift
//  StoreApp
//
//  Created by pop on 12/9/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var Listitems:[Items] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        fetchdata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableview.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Listitems.count
       // return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemcell") as? listcell else {
            return UITableViewCell()
          }
        let item1 = Listitems[indexPath.row]
        cell.upgradecell(item: item1)
        //cell.getcell()
        return cell
    }

    func fetchdata()
    {
        let fetchrequst = NSFetchRequest<Items>(entityName: "Items")
        do{
             Listitems = try context.fetch(fetchrequst)
            print("fetch done")
        }catch{
            print("error in fetch")
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
}

