//
//  CollectionViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/12/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CollectionViewCell"
    
    let uiLabel = UILabel()
    var dataRepository: [Repository] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionViewCell()
    }

    private func setUpCollectionViewCell() {
        contentView.addSubview(uiLabel)
        uiLabel.backgroundColor = .cyan
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiLabel.heightAnchor.constraint(equalToConstant: 50),
            uiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            uiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
    }
}
