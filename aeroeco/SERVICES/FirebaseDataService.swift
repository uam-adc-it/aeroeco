//
//  FirebaseDataService.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/5/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class FirebaseDateService {
    static let instance = FirebaseDateService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_ONLINE = DB_BASE.child("online-users")
    private var _REF_PROJECTS = DB_BASE.child("active-projects")
    private var _REF_RAMPPARTS = DB_BASE.child("ramp-parts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_ONLINE: DatabaseReference {
        return _REF_ONLINE
    }
    
    var REF_PROJECTS: DatabaseReference {
        return _REF_PROJECTS
    }
    
    var REF_RAMPPARTS: DatabaseReference {
        return _REF_RAMPPARTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
}
