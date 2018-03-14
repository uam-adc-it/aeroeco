//
//  Project.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/13/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

struct Project: Decodable {
    let id: Int?
    let name: String?
    let badge_count: Int?
    let location_id: Int?
    let lead_id: Int?
    let adc_project_id: Int?
    let stakeholder: String?
    let avatar: String?
    let target_completion: String?
    let started: String?
    let completed: String?
    let created_at: String?
    let updated_at: String?
}
