//
//  HighscoresTableViewController.swift
//  #Guess
//
//  Created by Seth Rininger on 9/8/15.
//  Copyright (c) 2015 Seth Rininger. All rights reserved.
//

import UIKit

class HighscoresTableViewController: UITableViewController {

    var highscores: [Int?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highscores.count
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var lbl: UILabel = UILabel()
        lbl.text = "Number of tries"
        lbl.textAlignment = NSTextAlignment.Center
        lbl.backgroundColor = UIColor.grayColor()
        return lbl
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "#\(indexPath.row + 1)\t\t\t\t\t\t\(String(highscores[indexPath.row]!))"
        return cell
    }

}
