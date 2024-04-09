//
//  ProfileViewCellController.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/8/24.
//

import UIKit

class ProfileViewCellController: UICollectionViewCell {
    static let cellIdentifier = "ProfileViewCell"
    
    private let repositoryLabel: UILabel = {
        var cgRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        var label = UILabel(frame: cgRect)
        label.backgroundColor = .clear
        label.layer.cornerRadius = 5
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupProfileViewCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setupProfileViewCellConstraints()
    }
    
    private func setUI() {
        self.addSubview(repositoryLabel)
    }
    
    private func setupProfileViewCellConstraints() {
        repositoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repositoryLabel.topAnchor.constraint(equalTo: self.topAnchor),
            repositoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            repositoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            repositoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
