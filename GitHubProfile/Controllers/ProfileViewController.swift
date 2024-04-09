//
//  ViewController.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/4/24.
//

import UIKit

class ProfileViewController: UICollectionViewController {
    static let identifier = "ProfileView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupCollectionViewConstraints()
    }

    func configureCollectionView() {
        // 셀 등록, 데이터 소스 및 델리게이트 설정
        collectionView.register(StackViewCell.self, forCellWithReuseIdentifier: StackViewCell.cellIdentifier)
        collectionView.register(TableViewCell.self, forCellWithReuseIdentifier: TableViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    /// AutoLayout 설정
    func setupCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // 2개의 섹션으로 나눔
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 1개의 섹션당 1개의 셀
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StackViewCell.cellIdentifier, for: indexPath) as? StackViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .systemGray2
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableViewCell.cellIdentifier, for: indexPath) as? TableViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = .systemGray
            return cell
        }
    }
    
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            // StackView 섹션의 크기
            return CGSize(width: collectionView.frame.width, height: 100)
        default:
            // TableView 섹션의 크기
            return CGSize(width: collectionView.frame.width, height: 400)
        }
    }
}

