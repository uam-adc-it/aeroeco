//
//  ProfileVC.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/6/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, rsp, err) in
            guard let data = data else { return }
            
            do {
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription)
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
            }
            catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
        }.resume()
        
//        let myCourse = Course(id: 1, name: "my Course", link: "some link", imageUrl: "some url")
//        print(myCourse)
    }
}
