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
    
    var projects = [
        "IT Solutions",
        "N117UA",
        "N118UA",
        "N121UA",
        "N171UA",
        "N182UA",
        "N700MP",
        "Tupelo Tasks",
        "UALUAM-7",
        "Verona Tasks"
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
        let cell = UITableViewCell()
        cell.textLabel?.text = projects[indexPath.row]
        return cell
    }
}

extension ProjectsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: ", indexPath.row)
        performSegue(withIdentifier: "goToReceiverVC", sender: self)
    }
}
