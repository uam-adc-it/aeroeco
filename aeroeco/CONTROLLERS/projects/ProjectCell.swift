//
//  ProjectCell.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/12/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgBadge: UIImageView!
    @IBOutlet weak var lblBadgeCount: UILabel!
    @IBOutlet weak var lblProjectName: UILabel!
    
    func configureCell(project: Project) {
        print("FROM CONFIGURE CELLL", project)
        lblProjectName!.text = project.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        //        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BadgedCell
        //        if cell == nil {
        //            cell = BadgedCell(style: .default, reuseIdentifier: "Cell");
        //        }
        //        cell?.textLabel!.text = projects[indexPath.row]["title"]
        //        cell?.detailTextLabel?.text = projects[indexPath.row]["title"]
        //        cell?.badgeString = projects[indexPath.row]["badge"]!
        //        cell?.badgeColor = .red
    }

}
