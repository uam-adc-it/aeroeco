//
//  PartsRouter.swift
//  aeroeco
//
//  Created by Jonathan Gravois on 3/8/18.
//  Copyright © 2018 Aerospace Disassembly Consortium. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    static let baseURLString = global.API_URL
    
    case getAllProjects()
    case getAllParts()
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getAllProjects:
                return .get
            case .getAllParts:
                return .get
            }
        }
        
        let url: URL = {
            let relativePath: String
            switch self {
            case .getAllProjects():
                relativePath = "get_active_projects"
            case .getAllParts():
                relativePath = "get_project_receivables"
            }
            
            var url = URL(string: ApiRouter.baseURLString)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        let params: ([String: Any]?) = {
            switch self {
            case .getAllProjects:
                return nil
            case .getAllParts:
                return nil
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
