//
//  MovieTableViewCell.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import UIKit
import Cosmos
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet var movieOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item : Movie){
        movieTitle.text = "\(item.title) (\(item.releaseDate.prefix(4)))"
        movieOverview.text = item.overview
        let url = URL(image: item.posterPath)
        movieImg.kf.setImage(with: url)
        movieReleaseDate.text = "\(item.dateFormatter())"
        movieImg.layer.cornerRadius = 8.0
        movieImg.clipsToBounds = true
        
    }
}
