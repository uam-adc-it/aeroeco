//
//  ProjectsVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/9/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class ProjectsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var projects : [[String:String]] = [
        ["title" : "IT Solutions", "badge": "0"],
        ["title" : "N117UA", "badge": "0"],
        ["title" : "N118UA", "badge": "7"],
        ["title" : "N121UA", "badge": "0"],
        ["title" : "N171UA", "badge": "21"],
        ["title" : "N182UA", "badge": "0"],
        ["title" : "N700MP", "badge": "0"],
        ["title" : "Tupelo Tasks", "badge": "0"],
        ["title" : "UALUAM-7", "badge": "0"],
        ["title" : "Verona Tasks", "badge": "0"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ProjectsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "BadgedCell", for: indexPath) as? BadgedCell
        if cell == nil {
            cell = BadgedCell(style: .default, reuseIdentifier: "BadgedCell");
        }
        cell?.textLabel!.text = projects[indexPath.row]["title"]
        cell?.detailTextLabel?.text = projects[indexPath.row]["title"]
        cell?.badgeString = projects[indexPath.row]["badge"]!
        cell?.badgeColor = .red
        
        return cell!
    }
}

extension ProjectsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: ", indexPath.row)
        performSegue(withIdentifier: "goToReceiverVC", sender: self)
    }
}
