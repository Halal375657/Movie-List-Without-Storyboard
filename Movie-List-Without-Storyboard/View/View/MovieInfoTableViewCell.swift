//
//  MovieInfoTableViewCell.swift
//  Movie-List-Without-Storyboard
//
//  Created by iOS on 1/6/22.
//

import UIKit

class MovieInfoTableViewCell: UITableViewCell {
    
    var movie: MovieViewModel? {
        didSet {
            guard let movie = movie else {
                return
            }

            titleLabel.text = movie.title
            overViewLabel.text = movie.overView
            posterImageView.loadFrom(URLAddress: Api.thumbnail + movie.posterImage)
        }
    }
    
    public static let reuseIdentifier = "cellId"
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let overViewLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let posterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(overViewLabel)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        posterImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 102).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        posterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10).isActive = true
        
        overViewLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10).isActive = true
        overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        contentView.trailingAnchor.constraint(equalTo: overViewLabel.trailingAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: overViewLabel.bottomAnchor, constant: 10).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
