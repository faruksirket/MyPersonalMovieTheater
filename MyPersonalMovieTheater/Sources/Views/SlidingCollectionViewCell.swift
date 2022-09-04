//
//  SlidingCollectionViewCell.swift
//  MyPersonalMovieTheater
//
//  Created by faruk sirket on 4.09.2022.
//

import UIKit

class SlidingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieOverview: UILabel!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    var arrImages = [UIImage(named: "joker")!, UIImage(named: "luck")!, UIImage(named: "prey")!, UIImage(named: "samaritan")!, UIImage(named: "thor")!, UIImage(named: "topgun")!, UIImage(named: "wonder")!]
    
    var arrTitles = ["Joker", "Luck", "Prey", "Samaritan", "Thor", "Top Gun", "Wonder"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item : Movie){
        movieTitle.text = item.title
        movieOverview.text = item.overview
        
        
        
    }
    
    
}
