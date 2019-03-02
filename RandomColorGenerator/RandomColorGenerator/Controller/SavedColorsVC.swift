//
//  SavedColorsVC.swift
//  RandomColorGenerator
//
//  Created by Vlad Munteanu on 3/1/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit

class SavedColorsVC: UITableViewController {
    
    internal let defaults = UserDefaults.standard.dictionaryRepresentation()
    let cellId = "cellId"
    
    //TODO: Make this a table view 
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTable()
       
        setupTableView()
    }
    
    func setupTableView(){
        //Registers a class for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
    
}

extension SavedColorsVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    
        //cell.textLabel?.text = savedColors[0]
        cell.textLabel?.text = "Hello World"
        //cell.backgroundColor = UIColor(
        //Convert from Hex Code to UIColor
        
        return cell
    }
}
