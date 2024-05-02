//
//  ViewController.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/4/24.
//

import SnapKit
import UIKit

enum State {
    case `default`
    case search
}

class ProfileViewController: UICollectionViewController {
    static let identifier = "ProfileView"
    let networkManager = NetworkManager()
    let username = "sinseunghyeon"
    
    var profile: Profile?
    var repositories: [Repository] = []
    var resultData: [Repository] = []
    var page = 1
    
    let searchBar = UISearchBar()
    var state: State = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNetWork()
        configureCollectionView()
        setupSearchBar()
        setupCollectionViewConstraints()
    }

    func setupNetWork() {
        networkManager.fetchGitHubUser(username: self.username) { [weak self] result in
            switch result {
            case .success(let profile):
                self?.profile = profile
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        networkManager.fetchRepositories(username: "apple", page: self.page) { [weak self] result in
            switch result {
            case .success(let repositories):
                self?.repositories = repositories
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureCollectionView() {
        // 셀 등록, 데이터 소스 및 델리게이트 설정
        collectionView.register(UINib(nibName: "StackViewCell", bundle: nil), forCellWithReuseIdentifier: StackViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        setupNetWork() // 네트워크 설정을 다시 호출하여 데이터 새로고침
            sender.endRefreshing() // 새로고침 제어를 종료합니다.
    }
    
    /// AutoLayout 설정
    func setupCollectionViewConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.delegate = self
    }
    
    // LoadMore 함수
    func loadMoreData() {
        if !networkManager.isLoading {
            networkManager.isLoading = true
            self.page += 1
            
            networkManager.fetchRepositories(username: "apple", page: self.page) { [weak self] result in
                switch result {
                case .success(let moreRepositories):
                    self?.repositories.append(contentsOf: moreRepositories)
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
                if self?.repositories.isEmpty != true {
                    self?.networkManager.isLoading = false
                }
            }
        }
    }
    
    // 2개의 섹션으로 나눔
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 1개의 섹션당 1개의 셀
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                // 프로필 섹션은 하나의 셀만 필요
                return 1
            default:
                // 저장소 섹션은 저장소 배열의 길이만큼 셀이 필요
            switch self.state {
            case .default:
                return repositories.count
            case .search:
                return resultData.count
            }
            }
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StackViewCell.cellIdentifier, for: indexPath) as? StackViewCell else {
                return UICollectionViewCell()
            }
            
            if let profile = self.profile {
                cell.setupLabel(id: profile.getLogin(), name: profile.getName(), region: profile.getRegion(), followers: profile.getFollowers(), following: profile.getFollowing())
            }
            
            cell.backgroundColor = .systemGray
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            switch self.state {
            case .default:
                cell.uiNameLabel.text = repositories[indexPath.row].getName()
                cell.uiLanguageLabel.text = repositories[indexPath.row].getLanguage()
            case .search:
                cell.uiNameLabel.text = resultData[indexPath.row].getName()
                cell.uiLanguageLabel.text = resultData[indexPath.row].getLanguage()
            }
            
            return cell
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        if offsetY > contentHeight - height {
            loadMoreData()
        }
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            // StackView 섹션의 크기
            return CGSize(width: collectionView.frame.width, height: 250)
        default:
            // CollectionViewCell 섹션의 크기
            return CGSize(width: collectionView.frame.width, height: 50)
        }
    }
}

extension ProfileViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.resultData.removeAll()
        
        for i in 0..<repositories.count {
            if repositories[i].getName().lowercased().contains(searchText.lowercased()) {
                self.resultData.append(repositories[i])
            }
        }
        if searchText.isEmpty {
            self.state = .default
        }
        collectionView.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.state = .search
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.state = .default
    }
}
