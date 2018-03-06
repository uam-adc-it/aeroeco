//
//  WelcomeVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/5/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit
import Firebase

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var btnLogin: RoundedShadowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser?.uid != nil) {
            //user is logged in
            performSegue(withIdentifier: "goToSwitchboardVC", sender: self)
        }
        else {
            //user in not logged in
            performSegue(withIdentifier: "goToLoginVC", sender: self)
        }
    }
    
    @IBAction func btnLoginWasPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLoginVC", sender: self)
    }
    
}
