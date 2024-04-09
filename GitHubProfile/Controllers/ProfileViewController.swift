//
//  ViewController.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/4/24.
//

import UIKit
import Alamofire
import Kingfisher

class ProfileViewController: UICollectionViewController {
    static let identifier = "ProfileView"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupCollectionViewConstraints()
    }

    func configureCollectionView() {
                
        // UICollectionView 초기화 및 설정
        collectionView = {
            let view = UICollectionView(frame: .zero, collectionViewLayout: ProfileViewController.getLayout())
            view.isScrollEnabled = true
            view.showsHorizontalScrollIndicator = false
            view.showsVerticalScrollIndicator = true
            view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
            view.contentInset = .zero
            view.backgroundColor = .clear
            view.clipsToBounds = true
            view.register(ProfileViewCellController.self, forCellWithReuseIdentifier: ProfileViewCellController.cellIdentifier)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
            
        // 셀 등록, 데이터 소스 및 델리게이트 설정
        collectionView.register(ProfileViewCellController.self, forCellWithReuseIdentifier: ProfileViewCellController.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
        
    static func getLayout() -> UICollectionViewCompositionalLayout {
      UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
        switch section {
        case 0:
            let itemFractionalWidthFraction = 1.0 / 2.0 // horizontal 2개의 셀
            let groupFractionalHeightFraction = 1.0 / 5.0 // vertical 5개의 셀
            let itemInset: CGFloat = 2.5
          
            // Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
          
            // Group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(groupFractionalHeightFraction)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 10)
          
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
            
            return section
            
        default:
            let itemFractionalWidthFraction = 1.0 // horizontal 1개의 셀
            let groupFractionalHeightFraction = 1.0 / 10.0 // vertical 10개의 셀
            let itemInset: CGFloat = 2.5
          
            // Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
          
            // Group
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(groupFractionalHeightFraction)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
          
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
            
            return section
        }
      }
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileViewCellController.cellIdentifier, for: indexPath) as? ProfileViewCellController else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .systemGray
        return cell
    }
}

