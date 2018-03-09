//
//  LoginVC.swift
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

class LoginVC: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var user_email = ""
    var user_key = ""
    var username = ""
    var dashboard = ""
    var adc_role_id = ""
    
    var userArray = ["Universal Asset Management"]
    let defaults = UserDefaults.standard
    
    @IBAction func btnProjects(_ sender: Any) {
    }
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        emailTextField.keyboardType = UIKeyboardType.emailAddress
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSwitchboard" {
            //let destinationVC = segue.destination as! SwitchboardViewController
        }
    }
    
    //MARK: METHODS
    
    @IBAction func loginPressed(_ sender: Any) {
        emailTextField.endEditing(true)
        SVProgressHUD.show()
        
        let parameters = [
            "email": emailTextField.text!,
            "password": passwordTextField.text!
        ]
        
        Alamofire.request("https://staging.movieplanes.com/swift/authenticate", method: .post, parameters: parameters).responseJSON { [weak self]
            response in
            print(response)
            if(response.result.isSuccess) {
                let userJSON: JSON = JSON(response.result.value!)
                self?.parseUserData(json: userJSON)
            }
            else {
                self?.clearLogin()
                let alert = UIAlertController(title: "Error", message: "Unable to connect to service.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{(action) in self?.clearLogin()}))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func clearLogin() {
        self.emailTextField.text! = ""
        self.passwordTextField.text! = ""
        self.emailTextField.becomeFirstResponder()
    }
    
    func parseUserData(json: JSON) {
        if json["error"].string! == "Invalid Credentials" {
            let alert = UIAlertController(title: "Error", message: "Those credentials are not recognized.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{(action) in self.clearLogin()}))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            userArray.append(self.emailTextField.text!)
            userArray.append(json["adckey"].string!)
            userArray.append(json["dashboard"].string!)
            userArray.append(json["username"].string!)
            userArray.append(json["role"].string!)
            
            defaults.set(userArray, forKey: "userArray")
            
            //LOGIN TO FIREBASE
            Auth.auth().signIn(withEmail: self.emailTextField.text!, password: json["adckey"].string!, completion: { (user, error) in
                if error != nil {
                    print(error ?? "There was an error logging in.")
                }
                else {
                    print("Login successful!")
                }
            })
            
            self.clearLogin()
            
            self.performSegue(withIdentifier: "goToSwitchboardVC", sender: self)
        }
        SVProgressHUD.dismiss()
    }
}
