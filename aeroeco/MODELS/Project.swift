//
//  Project.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/13/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class Project {
    let id: Int?
    let name: String?
    let active_project_status_id: Int?
    let badge_count: Int?
    let location_id: Int?
    let locale: String?
    let lead_id: Int?
    let bd_lead: String?
    let adc_project_id: Int?
    let stakeholder: String?
    let avatar: String?
    let target_completion: String?
    let started: String?
    let completed: String?
    
    required init?(json: [String: Any]) {
        guard
        let id = json["id"] as? Int,
        let name = json["name"] as? String else {
            return nil
        }
        
        let active_project_status_id = json["active_project_status_id"] as? Int
        let badge_count = json["badge_count"] as? Int
        let location_id = json["location_id"] as? Int
        let locale = json["locale"] as? String
        let bd_lead = json["bd_lead"] as? String
        let lead_id = json["lead_id"] as? Int
        let adc_project_id = json["adc_project_id"] as? Int
        let stakeholder = json["stakeholder"] as? String
        let avatar = json["avatar"] as? String
        let target_completion = json["target_completion"] as? String
        let started = json["started"] as? String
        let completed = json["completed"] as? String
        
        
        self.id = id
        self.name = name
        self.active_project_status_id = active_project_status_id
        self.badge_count = badge_count
        self.location_id = location_id
        self.locale = locale
        self.lead_id = lead_id
        self.bd_lead = bd_lead
        self.adc_project_id = adc_project_id
        self.stakeholder = stakeholder
        self.avatar = avatar
        self.target_completion = target_completion
        self.started = started
        self.completed = completed
    }
}
