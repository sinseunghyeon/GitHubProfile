//
//  Repository.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/10/24.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let node_id: String?
    let name: String
    let description: String?
    let language: String?
    
    enum CodingKeys: CodingKey {
        case id
        case node_id
        case name
        case description
        case language
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getLanguage() -> String {
        if let language = language {
            return language
        }
        return "-"
    }
}

