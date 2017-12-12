//
//  ViewController.swift
//  DSA NSKeyedArchiver
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class DSAListViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        DataModel.shared.load()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

}

extension DSAListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.getLists().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DSACell", for: indexPath)
        let DSAItem = DataModel.shared.getLists()[indexPath.row]
        cell.textLabel?.text = DSAItem.dsaTitle
        return cell
    }
    
}

extension DSAListViewController: UITableViewDelegate {
    
    
}












