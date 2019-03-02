//
//  SavedColorsVC.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class SavedColorsVC: UITableViewController {
    
    let cellId = "cellId"
    
    //TODO: Make this a table view 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
    }
    
    func setupTableView(){
        //Registers a class for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
}

extension SavedColorsVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Hello, World"
        
        return cell
    }
}
