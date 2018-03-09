//
//  ApiDataService.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/5/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import Foundation
import Alamofire

enum ApiManagerError: Error {
    case network(error: Error)
    case apiProvidedError(reason: String)
    case authCouldNot(reason: String)
    case authLost(reason: String)
    case objectSerialization(reason: String)
}

class ApiDataService {
    static let instance = ApiDataService()
    
    func printAllParts() -> Void {
        Alamofire.request(ApiRouter.getAllParts()).responseString { response in
            if let receivedString = response.result.value {
                print(receivedString)
            }
        }
    }
    
    func fetchAllParts(completionHandler: @escaping (Result<[Part]>) -> Void) {
        Alamofire.request(ApiRouter.getAllParts())
            .responseJSON { response in
                let result = self.partsArrayFromResponse(response: response)
                completionHandler(result)
            }
    }
    
    private func partsArrayFromResponse(response: DataResponse<Any>) -> Result<[Part]> {
        guard response.result.error == nil else {
            print(response.result.error!)
            return .failure(ApiManagerError.network(error: response.result.error!))
        }
        
        // Make sure we got JSON and it's an array
        guard let jsonArray = response.result.value as? [[String: Any]] else {
            print("didn't get array of object as JSON from API")
            return .failure(ApiManagerError.objectSerialization(reason:
                "Did not get JSON dictionary in response"))
        }
        
        // turn JSON into Parts
        var parts = [Part]()
        for item in jsonArray {
            if let part = Part(json: item) {
                parts.append(part)
            }
        }
        print("From Data Service")
        print(parts)
        return .success(parts)
    }
}
