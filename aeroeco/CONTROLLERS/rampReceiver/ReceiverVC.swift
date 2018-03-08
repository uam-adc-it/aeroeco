//
//  ReceiverVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/7/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReceiverVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partsArray: [Part] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 80
        tableView.estimatedRowHeight = 80
        
        //TEST
        ApiDataService.instance.printAllParts()
        //END TEST
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadParts()
    }
    
    //MARK: DATA RETRIEVAL METHODS
    func loadParts() {
        //ApiDataService.instance.printAllParts()
        let part1 = Part()
        part1.partNum = "B51-000-0201"
        part1.cage = "Cage"
        part1.can_8130 = true
        part1.cond_id = 1
        part1.condition = "AR"
        part1.db_id = "99000"
        part1.description = "Part on a Plane"
        part1.has_amm = true
        part1.is_esd = true
        part1.is_hazmat = false
        part1.is_priority = false
        part1.is_received = false
        part1.is_selected = false
        part1.loc_id = 2
        part1.location = "Kitchen Table"
        part1.mechanic = "Jon Gravois"
        part1.msn = "12345"
        part1.received = "2018-03-08"
        part1.receiver = "James Kachel"
        part1.tail = "N117UA"
        
        let part2 = Part()
        part2.partNum = "B52-000-0201"
        part2.cage = "Cage"
        part2.can_8130 = true
        part2.cond_id = 1
        part2.condition = "AR"
        part2.db_id = "99001"
        part2.description = "Part on a Ramp"
        part2.has_amm = false
        part2.is_esd = false
        part2.is_hazmat = true
        part2.is_priority = true
        part2.is_received = false
        part2.is_selected = false
        part2.loc_id = 2
        part2.location = "Kitchen Table"
        part2.mechanic = "Jon Gravois"
        part2.msn = "12345"
        part2.received = "2018-03-08"
        part2.receiver = "James Kachel"
        part2.tail = "N117UA"
        
        partsArray = [part1, part2]
        
        self.tableView.reloadData()
    }
    
    
    //MARK: DELEGATE METHODS
    func numberOfSections(in tableView: UITableView) -> Int {
        var numberOfSections: Int = 0
        if partsArray.count > 0 {
            tableView.separatorStyle = .singleLine
            numberOfSections = 1
            tableView.backgroundView = nil
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No components to receive"
            noDataLabel.textColor = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rampPartCell", for: indexPath) as! RampPartsCell
        let priorityCheck = partsArray[indexPath.row].is_priority
        let ammCheck = partsArray[indexPath.row].has_amm
        let hazmatCheck = partsArray[indexPath.row].is_hazmat
        let esdCheck = partsArray[indexPath.row].is_esd
        
        
        
        cell.lblPartNum.text = partsArray[indexPath.row].partNum
        cell.lblDesc.text = partsArray[indexPath.row].description
        cell.lblMSN.text = partsArray[indexPath.row].msn
        
        if ammCheck! {
            cell.lblAMM.textColor = UIColor.green
        }
        else {
            cell.lblAMM.textColor = UIColor.lightGray
        }
        
        if priorityCheck! {
            cell.imgPriority.image = UIImage(named: "priority")
        }
        else {
            cell.imgPriority.image = UIImage(named: "no_priority")
        }
        
        if hazmatCheck! {
            cell.imgHazmat.image = UIImage(named: "hazmat")
        }
        else {
            cell.imgHazmat.image = UIImage(named: "hazmat_not")
        }
        
        if esdCheck! {
            cell.imgESD.image = UIImage(named: "esd")
        }
        else {
            cell.imgESD.image = UIImage(named: "esd_not")
        }
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ReceiverTabController, let part = sender as? Part {
            print(part.partNum!)
            defaults.set(part.partNum!, forKey: "currRampPart")
            viewController.part = part
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sel_part = partsArray[indexPath.row]
        performSegue(withIdentifier: "goToTabController", sender: sel_part)
    }

}
