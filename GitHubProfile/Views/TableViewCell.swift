//
//  TableViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/9/24.
//

import UIKit
import Alamofire

class TableViewCell: UICollectionViewCell {
    static let cellIdentifier = "TableViewCell"
    // TableView를 추가하고 구성하는 코드
    let uitableView = UITableView()
    var dataRepository: [Repository] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        fetchRepositories(for: "apple")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        // TableView 설정
        uitableView.dataSource = self
        uitableView.delegate = self
        uitableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addSubview(uitableView)
        uitableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uitableView.topAnchor.constraint(equalTo: self.topAnchor),
            uitableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            uitableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            uitableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    
    // GitHub API로부터 repository 정보를 가져오는 함수
    func fetchRepositories(for user: String) {
        let url = "https://api.github.com/users/\(user)/repos"
        AF.request(url).responseDecodable(of: [Repository].self) { response in
            if let value = response.value {
                print(value)
                self.dataRepository = value
                self.uitableView.reloadData()
            }else {
                print("Error: ")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension TableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataRepository.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataRepository[indexPath.row].name
        return cell
    }
    
    
}
