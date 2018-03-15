//
//  RampPartsCell.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/7/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class RampPartsCell: UITableViewCell {
    
    @IBOutlet weak var imgPriority: UIImageView!
    @IBOutlet weak var imgESD: UIImageView!
    @IBOutlet weak var imgHazmat: UIImageView!
    
    @IBOutlet weak var lblPartNum: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblMSN: UILabel!
    @IBOutlet weak var lblAMM: UILabel!
    
    func configureCell(part: Part) {
        let priorityCheck = part.is_priority
        let ammCheck = part.has_amm
        let hazmatCheck = part.is_hazmat
        let esdCheck = part.is_esd
        
        lblPartNum.text = part.partNum
        lblDesc.text = part.description
        lblMSN.text = part.msn
        
        if priorityCheck! {
            imgPriority.image = UIImage(named: "priority")
        }
        else {
            imgPriority.image = UIImage(named: "no_priority")
        }
        
        if ammCheck! {
            lblAMM.textColor = UIColor.green
        }
        else {
            lblAMM.textColor = UIColor.lightGray
        }
        
        if hazmatCheck! {
            imgHazmat.image = UIImage(named: "hazmat")
        }
        else {
            imgHazmat.image = UIImage(named: "hazmat_not")
        }
        
        if esdCheck! {
            imgESD.image = UIImage(named: "esd")
        }
        else {
            imgESD.image = UIImage(named: "esd_not")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
