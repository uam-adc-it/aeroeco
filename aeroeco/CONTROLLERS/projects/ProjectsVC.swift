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
    
    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = global.API_URL + "get_active_projects"
        
        guard let url = URL(string: jsonUrlString) else {
            print("Error establishing server connection")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, rsp, err) in
            guard let data = data else {
                print("Error getting data from Server")
                return
            }
            
            do {
                self.projects = try JSONDecoder().decode([Project].self, from: data)
                //print(self.projects)
            }
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
    }
}

extension ProjectsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(projects[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectCell
        cell.configureCell(project: projects[indexPath.row])
        return cell
    }
}

extension ProjectsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: ", indexPath.row)
        performSegue(withIdentifier: "goToReceiverVC", sender: self)
    }
}
