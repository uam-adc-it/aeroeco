//
//  ProjectCell.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/14/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblProjectName: UILabel!
    @IBOutlet weak var vBadge: UIView!
    @IBOutlet weak var lblBadgeCount: UILabel!
    
    func configureCell() {
        lblProjectName!.text = "Example Project" //projects[indexPath.row].name
        imgIcon!.image = UIImage(named: "clerical")
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
