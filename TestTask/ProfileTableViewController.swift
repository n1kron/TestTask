//
//  ProfileTableViewController.swift
//  TestTask
//
//  Created by 123 on 14.10.17.
//  Copyright © 2017 Zarubin. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }


}
