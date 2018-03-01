//
//  ViewController.swift
//  GuessACode-Chilakala
//
//  Created by student on 2/28/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var legends:[String] = ["Darshan", "Swaroop", "Santhosh", "Mouli"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = legends[indexPath.row]
        return cell
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

