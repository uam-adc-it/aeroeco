//
//  Courses.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/13/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String?
    let description: String?
    let courses: [Course]
}
