//
//  ScanVC.swift
//  Pwned
//
//  Created by Vlad Munteanu on 3/5/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//


import UIKit
import WKZombie

var items : [HTMLTableColumn]?

class ScanVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sendWifiBttn.addTarget(self, action: #selector(sendWifi), for: UIControl.Event.touchUpInside)
        setupView()
        
    }
    
    func setupView() {
        self.title = "Scan 🕶"
        self.navigationController?.navigationBar.layer.masksToBounds = false
       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(refresh))
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(hamburgerMenuPressed))
    }
    
    @objc func refresh() {
        WifiDeauth.refreshWIFI(URL(string: "http://192.168.4.1/ssids.html")!)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items?[indexPath.row].children()?.first as HTMLElement?
        cell.textLabel?.text = item?.text
        return cell
    }
}
