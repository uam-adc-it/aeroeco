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
    
    func configureCell(project: Project) {
        if(project.badge_count! > 0) {
            
            lblBadgeCount!.text = "\(project.badge_count ?? 0)"
        }
        else {
            vBadge.isHidden = true
            lblBadgeCount.isHidden = true
        }
        
        lblProjectName!.text = project.name
        imgIcon!.image = UIImage(named: project.avatar!)
        
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
