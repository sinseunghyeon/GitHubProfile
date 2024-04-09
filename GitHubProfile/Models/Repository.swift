//
//  Repository.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/10/24.
//

import Foundation
import Alamofire

struct Repository: Decodable {
    let name: String
    let language: String?
}

// GitHub API로부터 repository 정보를 가져오는 함수
func fetchRepositories(for user: String) {
    let url = "https://api.github.com/users/\(user)/repos"
    AF.request(url).responseDecodable(of: [Repository].self) { response in
        if let value = response.value {
            print(value)
        }else {
            print("Error: ")
        }
    }
}



