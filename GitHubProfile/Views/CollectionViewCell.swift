//
//  CollectionViewCell.swift
//  GitHubProfile
//
//  Created by t2023-m0056 on 4/12/24.
//

import SnapKit
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
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
}
