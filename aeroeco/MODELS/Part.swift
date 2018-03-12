//
//  Part.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/7/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class Part {
    var db_id: Int
    var partNum: String
    var can_8130: Bool?
    var description: String?
    var has_amm: Bool?
    var is_esd: Bool?
    var is_hazmat: Bool?
    var is_priority: Bool?
    var is_selected: Bool?
    var is_received: Bool?
    var cage: String?
    var msn: String?
    var location: String?
    var condition: String?
    var tail: String?
    var craft: String?
    var mechanic: String?
    var received: String?
    var receiver: String?
    
    //   required init() {}
    
    required init?(json: [String: Any]) {
        guard
            let db_id = json["id"] as? Int,
            let partNum = json["part_number"] as? String else {
                return nil
        }
        let can_8130 = json["can_8130"] as? Bool
        let description = json["description"] as? String
        let has_amm = json["has_amm"] as? Bool
        let is_esd = json["is_esd"] as? Bool
        let is_hazmat = json["is_hazmat"] as? Bool
        let is_priority = json["is_priority"] as? Bool
        let is_selected = json["is_selected"] as? Bool
        let is_received = json["is_received"] as? Bool
        let cage = json["cage"] as? String
        let msn = json["serial_number"] as? String
        let location = json["location"] as? String
        let condition = json["condition"] as? String
        let tail = json["tail"] as? String
        let craft = json["craft"] as? String
        let mechanic = json["mechanic"] as? String
        let received = json["received"] as? String
        let receiver = json["receiver"] as? String
        
        
        self.db_id = db_id
        self.can_8130 = can_8130
        self.description = description
        self.has_amm = has_amm
        self.is_esd = is_esd
        self.is_hazmat = is_hazmat
        self.is_priority = is_priority
        self.is_selected = is_selected
        self.is_received = is_received
        self.cage = cage
        self.msn = msn
        self.partNum = partNum
        self.location = location
        self.condition = condition
        self.tail = tail
        self.craft = craft
        self.mechanic = mechanic
        self.received = received
        self.receiver = receiver
    }
}
