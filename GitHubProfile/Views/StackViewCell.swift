//
//  StackViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/9/24.
//

import Alamofire
import SnapKit
import UIKit
import Kingfisher

class StackViewCell: UICollectionViewCell {
    static let cellIdentifier = "StackViewCell"
    
    // StackView를 추가하고 구성하는 코드
    let stackView = UIStackView()
    let trailingStackView = UIStackView()
    let imageView = UIImageView()
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let regionLabel = UILabel()
    let followersLabel = UILabel()
    let followingLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStackView()
        setupTrailingStackView()
        setupImageView(username: "sinseunghyeon")
    }
    
    private func setupStackView() {
        // StackView 설정
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually // 아이템을 균등하게 채움
        stackView.spacing = 30 // 아이템 간의 간격 설정
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(trailingStackView)
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupTrailingStackView() {
        // StackView 설정
        trailingStackView.axis = .vertical
        trailingStackView.distribution = .fillEqually // 아이템을 균등하게 채움
        
        trailingStackView.addArrangedSubview(idLabel)
        trailingStackView.addArrangedSubview(nameLabel)
        trailingStackView.addArrangedSubview(regionLabel)
        trailingStackView.addArrangedSubview(followersLabel)
        trailingStackView.addArrangedSubview(followingLabel)
    }
    
    private func setupImageView(username: String) {
        imageView.contentMode = .scaleAspectFit // 이미지 비율 유지
        
        if let url = URL(string: "https://github.com/\(username).png") {
            imageView.kf.setImage(with: url)
        }
        
        imageView.image = UIImage(named: "none") // 이미지 이름 설정
    }
    
    func setupLabel(id: String, name: String, region: String, followers: String, following: String) {
        idLabel.text = "ID : " + id
        nameLabel.text = "Name : " + name
        regionLabel.text = "Region : " + region
        followersLabel.text = "Followers : " + followers
        followingLabel.text = "Following : " + following
    }
    
    
}

