//
//  Profile.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/8/24.
//

import Foundation
import Alamofire

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
    
    public init(login: String, id: Int, avatar_url: String, name: String? = nil, region: String? = nil, followers: Int? = nil, following: Int? = nil) {
        self.login = login
        self.id = id
        self.avatar_url = avatar_url
        self.name = name
        self.region = region
        self.followers = followers
        self.following = following
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
        return "Error"
    }
    
    public func getRegion() -> String {
        if let region = region {
            return region
        }
        return "Error"
    }
    
    public func getFollowers() -> String {
        if let followers = followers {
            return String(followers)
        }
        return "Error"
    }
    
    public func getFollowing() -> String {
        if let following = following {
            return String(following)
        }
        return "Error"
    }
}

func fetchGitHubUser(username: String) -> Profile {
    let url = "https://api.github.com/users/\(username)"
    var profile = Profile(login: "none", id: 0, avatar_url: "none")
    
    AF.request(url).responseDecodable(of: Profile.self) { response in
        if let user = response.value {
            print("GitHub User: \(user)")
            profile = Profile(login: user.login, id: user.id, avatar_url: user.avatar_url, name: user.name, region: user.region, followers: user.followers!, following: user.following!)
        }else {
            print("Error: ")
        }
    }
    return profile
}
