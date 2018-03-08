//
//  ApiDataService.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/5/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import Foundation
import Alamofire

class ApiDataService {
    static let instance = ApiDataService()
    
    func printAllParts() -> Void {
        Alamofire.request(ApiRouter.getAllParts()).responseString { response in
            if let receivedString = response.result.value {
                print(receivedString)
            }
        }
    }
}
