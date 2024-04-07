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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    func configureCollectionView() {
            // 컬렉션 뷰 레이아웃 생성
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
            collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            collectionView.backgroundColor = .systemBackground
            view.addSubview(collectionView)
            
            // 셀 등록
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            
            // 데이터 소스 및 델리게이트 설정
            collectionView.dataSource = self
    }
        
    func createLayout() -> UICollectionViewLayout {
        // 레이아웃 구성
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
                
            // 아이템
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
            // 그룹
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
            // 섹션
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
                
            return section
        }
            
        return layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10 // 예시로 10개의 아이템을 가정
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .systemBlue
            return cell
    }
}

