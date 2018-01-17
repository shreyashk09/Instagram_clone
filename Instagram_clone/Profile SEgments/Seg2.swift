//
//  Seg2.swift
//  Instagram_clone
//
//  Created by Shreyash Kawalkar on 16/01/18.
//  Copyright © 2018 Sk. All rights reserved.
//

import UIKit

class Seg2: UIViewController, UITableViewDataSource, UITableViewDelegate {

        @IBOutlet weak var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 44
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell", for: indexPath)
            return cell
        }
        
        
        
}



