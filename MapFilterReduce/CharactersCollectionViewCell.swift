//
//  CharactersCollectionViewCell.swift
//  MapFilterReduce
//
//  Created by Anatoliy Mamchenko on 09.03.2021.
//

import UIKit
import SnapKit

class MyCell: UICollectionViewCell {
    
    var imageView: UIImageView =  {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    var nameLabel: UILabel =  {
        let view: UILabel = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: view.font.pointSize, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    
    var ageLabel: UILabel =  {
        let view: UILabel = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: view.font.pointSize, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    
    var powerLabel: UILabel =  {
        let view: UILabel = UILabel()
        view.backgroundColor = .white
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.lineBreakMode = .byWordWrapping
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: view.font.pointSize, weight: .semibold)
        view.textAlignment = .center
        return view
    }()
    
    func configConstraints () {
        
        [imageView, nameLabel, ageLabel, powerLabel].forEach {addSubview($0)}
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(32)
            make.trailing.equalTo(self.snp.trailing).offset(-32)
            make.height.equalTo(self).multipliedBy(0.4)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.height.equalTo(self).multipliedBy(0.1)
        }
        
        ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.height.equalTo(self).multipliedBy(0.1)
        }
        
        powerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ageLabel.snp.bottom).offset(24)
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.height.equalTo(self).multipliedBy(0.1)
        }
    }
    
    
}
