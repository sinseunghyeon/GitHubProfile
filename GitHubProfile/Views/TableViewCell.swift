//
//  TableViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/9/24.
//

import UIKit

class TableViewCell: UICollectionViewCell {
    static let cellIdentifier = "TableViewCell"
    // TableView를 추가하고 구성하는 코드
    let uitableView = UITableView()
    let data = ["Item 1", "Item 2", "Item 3", "Item 1", "Item 2", "Item 3", "Item 1", "Item 2", "Item 3", "Item 1", "Item 2", "Item 3", "Item 1", "Item 2", "Item 3", "Item 1", "Item 2", "Item 3"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        // 사용 예시
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
        print("++++++++++++++++++++++++++++")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension TableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = uitableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell {
//            cell.textLabel?.text = data[indexPath.row]
//            return cell
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    
}
