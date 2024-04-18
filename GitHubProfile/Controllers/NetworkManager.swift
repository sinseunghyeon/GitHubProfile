//
//  NetworkManager.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/18/24.
//

import Foundation
import Alamofire

class NetworkManager {
    let url = "https://api.github.com/users/"
    var isLoading = false
    
    // GitHub API로부터 User 정보를 가져오는 함수
    func fetchGitHubUser(username: String, completion: @escaping (Result<Profile, Error>) -> Void) {
        let url = "\(self.url)\(username)"
        
        AF.request(url).validate().responseDecodable(of: Profile.self) { response in
            if let value = response.value {
                print("GitHub User: \(value)")
                completion(.success(value))
            } else {
                print("Error: ")
                completion(.failure(NSError()))
            }
        }
    }
    
    // GitHub API로부터 repository 정보를 가져오는 함수
    func fetchRepositories(username: String, page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let url = "\(self.url)\(username)/repos?page=\(page)"
        
        AF.request(url).responseDecodable(of: [Repository].self) { response in
            if let value = response.value {
                print(value)
                completion(.success(value))
            } else {
                print("Error: ")
                completion(.failure(NSError()))
            }
        }
    }
}
