//
//  SwitchboardVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/5/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON
import SVProgressHUD

class SwitchboardVC: UIViewController {
    
    //MARK: PROPERTIES
    let defaults = UserDefaults.standard
    
    //MARK: METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logoutPressed(_:)))
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        SVProgressHUD.show()
        
        var userArray = defaults.stringArray(forKey: "userArray")
        let user_email = userArray![1] as String
        
        let parameters = [
            "email": user_email
        ]
        
        do {
            try Auth.auth().signOut()
            print("Logout successful.")
            
            Alamofire.request(global.API_URL + "logout", method: .post, parameters: parameters)
                .responseString {
                    response in
                    if response.result.isSuccess {
                        //print(response)
                        SVProgressHUD.dismiss()
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    else {
                        SVProgressHUD.dismiss()
                        print("Error \(String(describing: response.result.error))")
                    }
            }
        }
        catch {
            print("There was a problem signing out.")
        }
    }

}
