//
//  ReceiverVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/7/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class ReceiverVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partsArray: [Part] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    //MARK: DATA RETRIEVAL METHODS
    
    
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