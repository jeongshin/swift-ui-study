//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by JeongShin on 2023/05/10.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
