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
    let defaults = UserDefaults.standard
    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 48
        tableView.estimatedRowHeight = 48
        
        //TEST
        //print("DEBUGGER")
        //ApiDataService.instance.printAllProjects()
        //END TEST
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadProjects()
    }
    
    //MARK: DATA RETRIEVAL METHODS
    func loadProjects() {
        ApiDataService.instance.fetchAllProjects() {
            result in
            guard result.error == nil else {
                if let error = result.error {
                    self.handleLoadProjectsError(error)
                }
            return
        }
            if let fetchedProjects = result.value {
                self.projects = fetchedProjects
            }
            self.tableView.reloadData()
        }
    }
    
    func handleLoadProjectsError(_ error: Error) {
        //TODO: show error
    }
    
    //MARK: SEGUE METHODS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ReceiverVC, let project = sender as? Project {
            print(project.name)
            defaults.set(project.name, forKey: "currProject")
            viewController.project = project
        }
    }
}

extension ProjectsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSections: Int = 0
        if projects.count > 0 {
            tableView.separatorStyle = .singleLine
            numberOfSections = 1
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "Loading projects from server ..."
            noDataLabel.textColor = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectCell
        cell.configureCell(project: projects[indexPath.row])
        return cell
        //return UITableViewCell()
    }
}

extension ProjectsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: ", indexPath.row)
        performSegue(withIdentifier: "goToReceiverVC", sender: self)
    }
}

