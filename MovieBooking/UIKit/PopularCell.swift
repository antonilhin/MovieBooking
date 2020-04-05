//
//  PopularCell.swift
//  MovieBooking
//
//  Created by Antoni on 27/03/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

class PopularCell: UICollectionViewCell {
    
    static let reuseId: String = "PopularCell"
    var movie: MovieViewModel?{
        didSet{
            if let movie = self.movie {
                imageView.kf.setImage(with: movie.posterUrl)
                titleLabel.text = movie.title
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "adastra.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad Astra"
        label.textColor = UIColor(named: "textColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupCell(){
        
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: (3/2)),
            
            titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
}
