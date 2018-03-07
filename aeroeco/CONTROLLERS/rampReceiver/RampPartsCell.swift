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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
