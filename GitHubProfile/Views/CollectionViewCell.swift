//
//  CollectionViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/12/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CollectionViewCell"
    
    let stackView = UIStackView()
    let uiNameLabel = UILabel()
    let uiLanguageLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionViewCell()
    }

    private func setUpCollectionViewCell() {
        contentView.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(uiNameLabel)
        stackView.addArrangedSubview(uiLanguageLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
    }
    
}
