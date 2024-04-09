//
//  StackViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/9/24.
//

import UIKit

class StackViewCell: UICollectionViewCell {
    static let cellIdentifier = "StackViewCell"
    var profile = fetchGitHubUser(username: "sinseunghyeon")
    // StackView를 추가하고 구성하는 코드
    let stackView = UIStackView()
    let trailingStackView = UIStackView()
    let imageView = UIImageView()
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let regionLabel = UILabel()
    let followersLabel = UILabel()
    let followingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupTrailingStackView()
        setupImageView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        // StackView 설정
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually // 아이템을 균등하게 채움
        stackView.spacing = 50 // 아이템 간의 간격 설정
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(trailingStackView)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
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
        trailingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailingStackView.topAnchor.constraint(equalTo: self.topAnchor),
            trailingStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            trailingStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 200),
            trailingStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit // 이미지 비율 유지
        imageView.image = UIImage(named: "none") // 이미지 이름 설정
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
    private func setupLabel() {
        idLabel.text = profile.getLogin()
        nameLabel.text = profile.getName()
        regionLabel.text = profile.getRegion()
        followersLabel.text = profile.getFollowers()
        followingLabel.text = profile.getFollowing()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
