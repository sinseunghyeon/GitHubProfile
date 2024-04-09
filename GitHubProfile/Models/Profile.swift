//
//  Profile.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/8/24.
//

import Foundation

struct Profile: Decodable {
    let login: String
    let id: Int
    let avatar_url: String
    let name: String?
    let region: String?
    let followers: Int?
    let following: Int?
    
    enum CodingKeys: CodingKey {
        case login
        case id
        case avatar_url
        case name
        case region
        case followers
        case following
      }
    
    public func getLogin() -> String{
        return login
    }
    
    public func getId() -> Int {
        return id
    }
    
    public func getName() -> String {
        if let name = name {
            return name
        }
        return "-"
    }
    
    public func getRegion() -> String {
        if let region = region {
            return region
        }
        return "-"
    }
    
    public func getFollowers() -> String {
        if let followers = followers {
            return String(followers)
        }
        return "-"
    }
    
    public func getFollowing() -> String {
        if let following = following {
            return String(following)
        }
        return "-"
    }
}


