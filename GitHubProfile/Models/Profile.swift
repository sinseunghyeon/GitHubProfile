//
//  Profile.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/8/24.
//

import Foundation
import Alamofire

struct Profile: Decodable {
    var login: String
    var id: Int
    var avatar_url: String
    let name: String?
    let region: String?
    var followers: Int?
    var following: Int?
    let image: String?
    
    init(login: String, id: Int, avatar_url: String, name: String? = nil, region: String? = nil, followers: Int? = nil, following: Int? = nil, image: String? = nil) {
        self.login = login
        self.id = id
        self.avatar_url = avatar_url
        self.name = name
        self.region = region
        self.followers = followers
        self.following = following
        self.image = image
    }
}

func fetchGitHubUser(username: String) -> Profile {
    let url = "https://api.github.com/users/\(username)"
    var profile = Profile(login: "none", id: 0, avatar_url: "none")
    
    AF.request(url).responseDecodable(of: Profile.self) { response in
        switch response.result {
        case .success(let user):
            print("GitHub User: \(user)")
            profile = Profile(login: user.login, id: user.id, avatar_url: user.avatar_url, name: user.name!, region: user.region, followers: user.followers!, following: user.following!, image: user.image)
        case .failure(let error):
            print("Error: \(error)")
        }
    }
    return profile
}
