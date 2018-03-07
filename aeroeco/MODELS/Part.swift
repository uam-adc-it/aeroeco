//
//  Part.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/7/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import Foundation

class Part {
    var db_id: String?
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
    var partNum: String?
    var loc_id: Int?
    var location: String?
    var cond_id: Int?
    var condition: String?
    var tail: String?
    var craft: String?
    var mechanic: String?
    var received: String?
    var receiver: String?
    
    
    init(db_id:String?, can_8130: Bool, description: String?, has_amm: Bool?, is_esd: Bool?, is_hazmat: Bool?, is_priority: Bool?, is_selected: Bool?, is_received: Bool?, cage: String?, msn: String?, partNum: String?, loc_id: Int?, location: String?, cond_id: Int?, condition: String?, tail: String?, craft: String?, mechanic: String?, received: String?, receiver: String?) {
        self.db_id = db_id;
        self.can_8130 = can_8130;
        self.description = description;
        self.has_amm = has_amm;
        self.is_esd = is_esd;
        self.is_hazmat = is_hazmat;
        self.is_priority = is_priority;
        self.is_selected = is_selected;
        self.is_received = is_received;
        self.cage = cage;
        self.msn = msn;
        self.partNum = partNum;
        self.loc_id = loc_id;
        self.location = location;
        self.cond_id = cond_id;
        self.condition = condition;
        self.tail = tail;
        self.craft = craft;
        self.mechanic = mechanic;
        self.received = received;
        self.receiver = receiver;
        
    }
}
